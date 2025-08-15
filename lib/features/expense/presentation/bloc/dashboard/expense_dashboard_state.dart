part of 'expense_dashboard_bloc.dart';

@freezed
class ExpenseDashboardState with _$ExpenseDashboardState {
  const factory ExpenseDashboardState.initial() = expenseDashboardInitialState;
  const factory ExpenseDashboardState.loading() = expenseDashboardLoadingState;
  const factory ExpenseDashboardState.loaded({
    required DashboardData data,
    @Default(30) int currentDayCount,
    @Default(1) int currentAccountId,
  }) = expenseDashboardLoadedState;
  const factory ExpenseDashboardState.dayCountChanged({
    required DashboardData data,
    required int newDayCount,
    @Default(1) int currentAccountId,
  }) = expenseDashboardDayCountChangedState;
  const factory ExpenseDashboardState.accountChanged({
    required DashboardData data,
    @Default(30) int currentDayCount,
    required int newAccountId,
  }) = expenseDashboardAccountChangedState;
  const factory ExpenseDashboardState.error({
    required String message,
  }) = expenseDashboardErrorState;
  
}
