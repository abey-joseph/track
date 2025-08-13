part of 'expense_dashboard_bloc.dart';

@freezed
class ExpenseDashboardEvent with _$ExpenseDashboardEvent {
  const factory ExpenseDashboardEvent.fetchAllSummary() = _FetchAllSummary;
  const factory ExpenseDashboardEvent.clickedDayCountForRecentTxn(
      {required int currentDayCount}) = _ClickedDayCountForRecentTxn;
  const factory ExpenseDashboardEvent.clickedchangeAccountForSummary(
      {required int currentAccountID}) = _ClickedChangeAccountForSummary;
}
