part of 'expense_dashboard_bloc.dart';

@freezed
class ExpenseDashboardState with _$ExpenseDashboardState {
  const factory ExpenseDashboardState.initial() = expenseDashboardInitialState;
  const factory ExpenseDashboardState.loading() = expenseDashboardLoadingState;
  const factory ExpenseDashboardState.loaded({required int dayCount, required int txnCount, required List<TransactionEntity> recentTransactions, required AccountEntity account, required List<TransactionEntity> accountTransactions}) = expenseDashboardLoadedState;
  const factory ExpenseDashboardState.recentTxnstate({required int dayCount, required int txnCount, required List<TransactionEntity> recentTransactions}) =
      recentTxnState;
  const factory ExpenseDashboardState.accountDetailsState({required AccountEntity account, required List<TransactionEntity> accountTransactions}) =
      accountDetailsState;
  const factory ExpenseDashboardState.error({required String message}) = expenseDashboardErrorState;
}
