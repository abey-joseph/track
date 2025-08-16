
import 'package:dartz/dartz.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/features/expense/domain/entities/account_entity.dart';
import 'package:track/features/expense/domain/entities/category_entity.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';

abstract class ExpenseRepository {
  // Accounts
  Future<Either<Failure, List<AccountEntity>>> getAccounts({required String uid});
  Future<Either<Failure, void>> addAccount({required AccountEntity account});
  Future<Either<Failure, void>> updateAccount({required AccountEntity account});

  // Categories
  Future<Either<Failure, List<CategoryEntity>>> getCategories({required String uid});
  Future<Either<Failure, void>> addCategory({required CategoryEntity category});
  Future<Either<Failure, void>> updateCategory({required CategoryEntity category});

  // Transactions
  Future<Either<Failure, List<TransactionEntity>>> getTransactions({
    required String uid,
    DateTime? from,
    DateTime? to,
  });
  Future<Either<Failure, void>> addTransaction({required TransactionEntity transaction});
  Future<Either<Failure, void>> updateTransaction({required TransactionEntity transaction});
}


