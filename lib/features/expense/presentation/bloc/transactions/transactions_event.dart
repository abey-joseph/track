part of 'transactions_bloc.dart';

@freezed
class TransactionsEvent with _$TransactionsEvent {
  const factory TransactionsEvent.load({required String uid, DateTime? from, DateTime? to}) = _TransactionsLoad;
  const factory TransactionsEvent.add({required TransactionEntity transaction}) = _TransactionsAdd;
  const factory TransactionsEvent.update({required TransactionEntity transaction}) = _TransactionsUpdate;
}


