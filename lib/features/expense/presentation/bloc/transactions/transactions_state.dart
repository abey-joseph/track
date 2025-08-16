part of 'transactions_bloc.dart';

@freezed
class TransactionsState with _$TransactionsState {
  const factory TransactionsState.initial() = _TransactionsInitial;
  const factory TransactionsState.loading() = _TransactionsLoading;
  const factory TransactionsState.loaded(List<TransactionEntity> transactions) = _TransactionsLoaded;
  const factory TransactionsState.failure(String message) = _TransactionsFailure;
}


