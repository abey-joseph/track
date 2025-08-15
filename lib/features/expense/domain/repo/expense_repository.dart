import 'package:dartz/dartz.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';
import 'package:track/features/expense/domain/entities/account_entity.dart';
import 'package:track/features/expense/domain/entities/category_entity.dart';
import 'package:track/features/expense/domain/entities/payee_entity.dart';

abstract class ExpenseRepository {
  // Transaction operations
  Future<Either<Failure, List<TransactionEntity>>> getRecentTransactions({
    required String uid,
    int limit = 10,
    int dayCount = 30,
  });

  Future<Either<Failure, int>> getTransactionCountInPeriod({
    required String uid,
    required int dayCount,
  });

  Future<Either<Failure, List<TransactionEntity>>> getTodayTransactions({
    required String uid,
    int limit = 10,
  });

  Future<Either<Failure, TransactionEntity>> createTransaction(
    TransactionEntity transaction,
  );

  Future<Either<Failure, TransactionEntity>> updateTransaction(
    TransactionEntity transaction,
  );

  Future<Either<Failure, void>> deleteTransaction(int transactionId);

  // Account operations
  Future<Either<Failure, List<AccountEntity>>> getAccounts(String uid);
  
  Future<Either<Failure, AccountEntity>> getAccountById(int accountId);

  Future<Either<Failure, AccountEntity>> createAccount(AccountEntity account);

  Future<Either<Failure, AccountEntity>> updateAccount(AccountEntity account);

  Future<Either<Failure, void>> deleteAccount(int accountId);

  // Category operations
  Future<Either<Failure, List<CategoryEntity>>> getCategories(String uid);

  // Payee operations
  Future<Either<Failure, List<PayeeEntity>>> getPayees(String uid);

  Future<Either<Failure, PayeeEntity>> createPayee(PayeeEntity payee);

  Future<Either<Failure, PayeeEntity>> updatePayee(PayeeEntity payee);

  Future<Either<Failure, void>> deletePayee(int payeeId);
}
