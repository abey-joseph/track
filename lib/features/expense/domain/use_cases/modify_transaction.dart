import 'package:injectable/injectable.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';
import 'package:track/features/expense/domain/repo/expense_repository.dart';

@lazySingleton
class AddTransaction {
  final ExpenseRepository _repo = getIt<ExpenseRepository>();
  Future<void> call({required TransactionEntity transaction}) => _repo.addTransaction(transaction: transaction);
}

@lazySingleton
class UpdateTransaction {
  final ExpenseRepository _repo = getIt<ExpenseRepository>();
  Future<void> call({required TransactionEntity transaction}) => _repo.updateTransaction(transaction: transaction);
}


