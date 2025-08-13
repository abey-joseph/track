part of 'expense_dashboard_bloc.dart';

@freezed
class ExpenseDashboardState with _$ExpenseDashboardState {
  const factory ExpenseDashboardState.initial() = expenseDashboardInitialState;
  const factory ExpenseDashboardState.loading() = expenseDashboardLoadingState;
  const factory ExpenseDashboardState.loaded() = expenseDashboardLoadedState;
  const factory ExpenseDashboardState.error() = expenseDashboardErrorState;
  const factory ExpenseDashboardState.recentTxnDayCountChanged() =
      recentTxnDayCountChanged;
  const factory ExpenseDashboardState.selectedAccountChanged() =
      selectedAccountChanged;
}
