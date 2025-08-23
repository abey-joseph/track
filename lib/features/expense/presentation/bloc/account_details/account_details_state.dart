part of 'account_details_bloc.dart';

@freezed
class AccountDetailsState with _$AccountDetailsState {
  const factory AccountDetailsState.initial() = _AccountDetailsInitial;
  const factory AccountDetailsState.loading() = _AccountDetailsLoading;
  const factory AccountDetailsState.loaded({
    required AccountEntity account,
    required AccountFilter filter,
    required AccountTotals totals,
    required AccountCounts counts,
    required DonutChartData donutData,
    required Map<DateTime, List<TransactionEntity>> groupedTransactions,
  }) = _AccountDetailsLoaded;
  const factory AccountDetailsState.failure(String message) =
      _AccountDetailsFailure;
}
