import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:track/features/expense/domain/entities/dashboard_data.dart';
import 'package:track/features/expense/domain/use_cases/get_dashboard_data.dart';

part 'expense_dashboard_event.dart';
part 'expense_dashboard_state.dart';
part 'expense_dashboard_bloc.freezed.dart';

@injectable
class ExpenseDashboardBloc
    extends Bloc<ExpenseDashboardEvent, ExpenseDashboardState> {
  final GetDashboardData _getDashboardData;

  ExpenseDashboardBloc(this._getDashboardData) 
      : super(const ExpenseDashboardState.initial()) {
    on<_FetchAllSummary>(_onFetchAllSummary);
    on<_ClickedDayCountForRecentTxn>(_onClickedDayCountForRecentTxn);
    on<_ClickedChangeAccountForSummary>(_onClickedChangeAccountForSummary);
  }

  Future<void> _onFetchAllSummary(
    _FetchAllSummary event,
    Emitter<ExpenseDashboardState> emit,
  ) async {
    log('📊 [ExpenseDashboardBloc] Fetching all summary for uid: ${event.uid}'); // TODO: Remove log
    emit(const ExpenseDashboardState.loading());
    
    final result = await _getDashboardData.call(
      uid: event.uid,
      limit: 10,
      dayCount: 30,
    );

    result.fold(
      (failure) {
        log('❌ [ExpenseDashboardBloc] Error fetching dashboard data: ${failure.message}'); // TODO: Remove log
        emit(ExpenseDashboardState.error(message: failure.message));
      },
      (data) {
        log('✅ [ExpenseDashboardBloc] Dashboard data fetched successfully:'); // TODO: Remove log
        log('   - Recent transactions: ${data.recentTransactions.length}'); // TODO: Remove log
        log('   - Transaction count in ${data.periodDays}D: ${data.transactionCountInPeriod}'); // TODO: Remove log
        for (var txn in data.recentTransactions.take(3)) {
          log('   - ${txn.note ?? 'Unknown'}: ${txn.amount} (${txn.occurredOn})'); // TODO: Remove log
        }
        emit(ExpenseDashboardState.loaded(data: data));
      },
    );
  }

  Future<void> _onClickedDayCountForRecentTxn(
    _ClickedDayCountForRecentTxn event,
    Emitter<ExpenseDashboardState> emit,
  ) async {
    final currentState = state;
    String uid = '';
    int currentAccountId = 1;
    
    // Extract current state data
    currentState.when(
      initial: () {},
      loading: () {},
      loaded: (data, dayCount, accountId) {
        uid = data.recentTransactions.isNotEmpty ? data.recentTransactions.first.uid : '';
        currentAccountId = accountId;
      },
      dayCountChanged: (data, dayCount, accountId) {
        uid = data.recentTransactions.isNotEmpty ? data.recentTransactions.first.uid : '';
        currentAccountId = accountId;
      },
      accountChanged: (data, dayCount, accountId) {
        uid = data.recentTransactions.isNotEmpty ? data.recentTransactions.first.uid : '';
        currentAccountId = accountId;
      },
      error: (_) {},
    );

    if (uid.isEmpty) return;

    log('🔄 [ExpenseDashboardBloc] Day count changed to: ${event.currentDayCount}'); // TODO: Remove log
    
    final result = await _getDashboardData.call(
      uid: uid,
      limit: 10,
      dayCount: event.currentDayCount,
    );

    result.fold(
      (failure) {
        log('❌ [ExpenseDashboardBloc] Error changing day count: ${failure.message}'); // TODO: Remove log
        emit(ExpenseDashboardState.error(message: failure.message));
      },
      (data) {
        log('✅ [ExpenseDashboardBloc] Day count changed successfully to ${event.currentDayCount}D'); // TODO: Remove log
        log('   - New transaction count: ${data.transactionCountInPeriod}'); // TODO: Remove log
        emit(ExpenseDashboardState.dayCountChanged(
          data: data,
          newDayCount: event.currentDayCount,
          currentAccountId: currentAccountId,
        ));
      },
    );
  }

  Future<void> _onClickedChangeAccountForSummary(
    _ClickedChangeAccountForSummary event,
    Emitter<ExpenseDashboardState> emit,
  ) async {
    final currentState = state;
    DashboardData? data;
    int currentDayCount = 30;
    
    // Extract current state data
    currentState.when(
      initial: () {},
      loading: () {},
      loaded: (dashboardData, dayCount, accountId) {
        data = dashboardData;
        currentDayCount = dayCount;
      },
      dayCountChanged: (dashboardData, dayCount, accountId) {
        data = dashboardData;
        currentDayCount = dayCount;
      },
      accountChanged: (dashboardData, dayCount, accountId) {
        data = dashboardData;
        currentDayCount = dayCount;
      },
      error: (_) {},
    );

    if (data == null) return;

    log('🔄 [ExpenseDashboardBloc] Account changed to: ${event.currentAccountID}'); // TODO: Remove log
    
    emit(ExpenseDashboardState.accountChanged(
      data: data!,
      currentDayCount: currentDayCount,
      newAccountId: event.currentAccountID,
    ));
  }
}
