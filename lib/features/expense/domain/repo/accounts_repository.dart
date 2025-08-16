
import 'package:dartz/dartz.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/features/expense/domain/entities/account_entity.dart';

abstract class AccountsRepository {
  Future<Either<Failure, List<AccountEntity>>> getAccounts({required String uid});
  Future<Either<Failure, void>> addAccount({required AccountEntity account});
  Future<Either<Failure, void>> updateAccount({required AccountEntity account});
  Future<Either<Failure, void>> deleteAccount({required int accountId, required String uid});
  Future<Either<Failure, void>> setDefaultAccount({required int accountId, required String uid});
  Future<Either<Failure, bool>> isAccountInUse({required int accountId, required String uid});
}


