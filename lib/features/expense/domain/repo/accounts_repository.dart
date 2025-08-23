import 'package:dartz/dartz.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/features/expense/domain/entities/raw_entities/account_entity.dart';
import 'package:track/features/expense/domain/entities/raw_entities/transaction_entity.dart';

abstract class AccountsRepository {
  Future<Either<Failure, List<AccountEntity>>> getAccounts(
      {required String uid});
  Future<Either<Failure, AccountEntity>> getAccount(
      {required String uid, required int accountId});
  Future<Either<Failure, void>> addAccount({required AccountEntity account});
  Future<Either<Failure, void>> updateAccount({required AccountEntity account});
  Future<Either<Failure, void>> deleteAccount(
      {required int accountId, required String uid});
  Future<Either<Failure, void>> setDefaultAccount(
      {required int accountId, required String uid});
  Future<Either<Failure, bool>> isAccountInUse(
      {required int accountId, required String uid});

  Future<Either<Failure, List<TransactionEntity>>> getAccountTransactions({
    required String uid,
    required int accountId,
    DateTime? fromDate,
    DateTime? toDate,
    TransactionType? transactionType,
  });

  // Current balance regardless of filter
  Future<Either<Failure, double>> getAccountBalance({
    required String uid,
    required int accountId,
  });
}
