import 'package:injectable/injectable.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';
import 'package:track/features/expense/domain/repo/expense_repository.dart';

@lazySingleton
class GetTransactions {
  final ExpenseRepository _repo = getIt<ExpenseRepository>();
  Future<List<TransactionEntity>> call({required String uid, DateTime? from, DateTime? to}) =>
      _repo.getTransactions(uid: uid, from: from, to: to);
}


