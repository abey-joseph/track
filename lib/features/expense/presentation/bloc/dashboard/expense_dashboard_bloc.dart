import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/services/logging_service.dart';
import 'package:track/features/expense/domain/entities/account_entity.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';

part 'expense_dashboard_event.dart';
part 'expense_dashboard_state.dart';
part 'expense_dashboard_bloc.freezed.dart';

@lazySingleton
class ExpenseDashboardBloc
    extends Bloc<ExpenseDashboardEvent, ExpenseDashboardState> {
  ExpenseDashboardBloc() : super(expenseDashboardInitialState()) {
    on<ExpenseDashboardEvent>((event, emit) async{
      logger.info('ExpenseDashboardEvent received: ${event.runtimeType}',
          tag: 'ExpenseDashboardBloc');

      await event.when(
        fetchAllSummary: () async => _onFetchAllSummary(emit),
        clickedDayCountForRecentTxn: (currentDayCount) =>
            _onClickedDayCountForRecentTxn(currentDayCount, emit),
        clickedchangeAccountForSummary: (currentAccountID) =>
            _onClickedChangeAccountForSummary(currentAccountID, emit),
      );
    });
  }

  Future<void> _onFetchAllSummary(Emitter<ExpenseDashboardState> emit) async {
    emit(expenseDashboardLoadingState());


    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 2));



    try {
      // For now, emit sample data
      // In real implementation, you would fetch from repositories
      // TODO: add fetching from repository

      final sampleTransactions = _getSampleTransactions();
      final sampleAccount = _getSampleAccount();

      // Emit loaded state with all data
      emit(ExpenseDashboardState.loaded(
        dayCount: 30,
        txnCount: sampleTransactions.length,
        recentTransactions: sampleTransactions,
        account: sampleAccount,
        accountTransactions: sampleTransactions,
      ));
      //log("message");
    } catch (e) {
      emit(ExpenseDashboardState.error(message: e.toString()));
    }
  }

  Future<void> _onClickedDayCountForRecentTxn(
      int currentDayCount, Emitter<ExpenseDashboardState> emit) async{
    final sampleTransactions = _getSampleTransactions();

    emit(ExpenseDashboardState.recentTxnstate(
      dayCount: currentDayCount,
      txnCount: sampleTransactions.length,
      recentTransactions: sampleTransactions,
    ));
  }

  Future<void> _onClickedChangeAccountForSummary(
      int currentAccountID, Emitter<ExpenseDashboardState> emit) async{
    final sampleTransactions = _getSampleTransactions();
    final sampleAccount = _getSampleAccount();

    emit(ExpenseDashboardState.accountDetailsState(
      account: sampleAccount,
      accountTransactions: sampleTransactions,
    ));
  }

  // Sample data methods - replace with actual repository calls
  List<TransactionEntity> _getSampleTransactions() {
    return [
      TransactionEntity(
        uid: '1',
        accountId: 1,
        type: TransactionType.expense,
        amount: 45.20,
        currency: '\$',
        note: 'Grocery Store',
        occurredOn: DateTime.now().subtract(const Duration(hours: 2)),
        createdAt: DateTime.now(),
      ),
      TransactionEntity(
        uid: '2',
        accountId: 1,
        type: TransactionType.expense,
        amount: 20.00,
        currency: '\$',
        note: 'Metro Top-up',
        occurredOn: DateTime.now().subtract(const Duration(hours: 3)),
        createdAt: DateTime.now(),
      ),
      TransactionEntity(
        uid: '3',
        accountId: 1,
        type: TransactionType.income,
        amount: 3000.00,
        currency: '\$',
        note: 'Salary',
        occurredOn: DateTime.now().subtract(const Duration(days: 1)),
        createdAt: DateTime.now(),
      ),
      TransactionEntity(
        uid: '4',
        accountId: 1,
        type: TransactionType.expense,
        amount: 12.90,
        currency: '\$',
        note: 'Lunch',
        occurredOn: DateTime.now().subtract(const Duration(days: 1, hours: 12)),
        createdAt: DateTime.now(),
      ),
    ];
  }

  AccountEntity _getSampleAccount() {
    return AccountEntity(
      uid: '1',
      name: 'Main Account',
      type: AccountType.bank,
      currency: '\$',
      createdAt: DateTime.now(),
    );
  }
}
