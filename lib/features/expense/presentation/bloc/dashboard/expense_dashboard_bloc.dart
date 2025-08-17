import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/services/logging_service.dart';
import 'package:track/core/auth/firebase_services.dart';
import 'package:track/features/expense/domain/use_cases/get_accounts.dart';
import 'package:track/features/expense/domain/use_cases/get_dashboard_summaries.dart';
import 'package:track/features/expense/domain/entities/account_entity.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';
import 'package:track/features/expense/domain/repo/dashboard_repository.dart';

part 'expense_dashboard_event.dart';
part 'expense_dashboard_state.dart';
part 'expense_dashboard_bloc.freezed.dart';

@injectable
class ExpenseDashboardBloc
    extends Bloc<ExpenseDashboardEvent, ExpenseDashboardState> {
  final GetRecentTransactionsSummary _getRecentSummary;
  final GetAccountDetailsSummary _getAccountSummary;
  final GetAllAccountBalances _getBalances;
  final GetTodayTransactionsSummaryUC _getToday;
  final FirebaseAuthService _auth;
  final GetAccounts _getAccounts;

  ExpenseDashboardBloc(
    this._getRecentSummary,
    this._getAccountSummary,
    this._getBalances,
    this._getToday,
    this._auth,
    this._getAccounts,
  ) : super(expenseDashboardInitialState()) {
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

    final uid = _auth.currentUser?.uid;
    if (uid == null) {
      emit(const ExpenseDashboardState.error(message: 'User not authenticated'));
      return;
    }

    try {
      const int dayCount = 30;

      final recentEither = await _getRecentSummary.call(uid: uid, dayCount: dayCount);
      final accountEither = await _getAccountSummary.call(uid: uid);
      final balancesEither = await _getBalances.call(uid: uid);
      final todayEither = await _getToday.call(uid: uid);

      await recentEither.fold(
        (failure) async {
          emit(ExpenseDashboardState.error(message: failure.message));
        },
        (recent) async {
          await accountEither.fold(
            (failure) async {
              emit(ExpenseDashboardState.error(message: failure.message));
            },
            (account) async {
              await balancesEither.fold(
                (failure) async {
                  emit(ExpenseDashboardState.error(message: failure.message));
                },
                (balances) async {
                  await todayEither.fold(
                    (failure) async {
                      emit(ExpenseDashboardState.error(message: failure.message));
                    },
                    (today) async {
                      emit(ExpenseDashboardState.loaded(
                        dayCount: dayCount,
                        txnCount: recent.totalCount,
                        recentTransactions: recent.transactions.toList(),
                        account: account.account,
                        accountTransactions: account.transactions.toList(),
                        accountBalances: balances,
                        todayCount: today.count,
                        todayTransactions: today.transactions.toList(),
                        accountBalance: account.balance,
                      ));
                    },
                  );
                },
              );
            },
          );
        },
      );
    } catch (e) {
      emit(ExpenseDashboardState.error(message: e.toString()));
    }
  }

  Future<void> _onClickedDayCountForRecentTxn(
      int currentDayCount, Emitter<ExpenseDashboardState> emit) async{
    final uid = _auth.currentUser?.uid;
    if (uid == null) {
      emit(const ExpenseDashboardState.error(message: 'User not authenticated'));
      return;
    }

    final nextDayCount = _nextDayCount(currentDayCount);

    final recentEither = await _getRecentSummary.call(uid: uid, dayCount: nextDayCount);
    recentEither.fold(
      (failure) {
        emit(ExpenseDashboardState.error(message: failure.message));
      },
      (recent) {
        emit(ExpenseDashboardState.recentTxnstate(
          dayCount: nextDayCount,
          txnCount: recent.totalCount,
          recentTransactions: recent.transactions,
        ));
      },
    );
  }

  Future<void> _onClickedChangeAccountForSummary(
      int currentAccountID, Emitter<ExpenseDashboardState> emit) async{
    final uid = _auth.currentUser?.uid;
    if (uid == null) {
      emit(const ExpenseDashboardState.error(message: 'User not authenticated'));
      return;
    }

    // Cycle to next account: fetch all accounts and pick the next index
    final accountsEither = await _getAccounts.call(uid: uid);
    await accountsEither.fold(
      (failure) async {
        emit(ExpenseDashboardState.error(message: failure.message));
      },
      (accounts) async {

        if (accounts.isEmpty) {
          emit(const ExpenseDashboardState.error(message: 'No accounts found'));
          return;
        }
   
        int currentIndex = accounts.indexWhere((a) => a.accountId == currentAccountID);

        if (currentIndex < 0) currentIndex = 0;
        final nextIndex = (currentIndex + 1) % accounts.length;

        final nextAccountId = accounts[nextIndex].accountId;


        final accountEither = await _getAccountSummary.call(
          uid: uid,
          accountId: nextAccountId,
        );

        accountEither.fold(
          (failure) {
            emit(ExpenseDashboardState.error(message: failure.message));
          },
          (account) {
            
            
            emit(ExpenseDashboardState.accountDetailsState(
              account: account.account,
              accountTransactions: account.transactions.toList(),
              accountBalance: account.balance,
            ));
          },
        );
      },
    );
  }

  int _nextDayCount(int current) {
    switch (current) {
      case 7:
        return 15;
      case 15:
        return 30;
      case 30:
      default:
        return 7;
    }
  }
}
