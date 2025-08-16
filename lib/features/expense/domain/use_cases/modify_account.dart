import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/features/expense/domain/entities/account_entity.dart';
import 'package:track/features/expense/domain/repo/accounts_repository.dart';

@lazySingleton
class AddAccount {
  final AccountsRepository _repo = getIt<AccountsRepository>();
  Future<Either<Failure, void>> call({required AccountEntity account}) => 
      _repo.addAccount(account: account);
}

@lazySingleton
class UpdateAccount {
  final AccountsRepository _repo = getIt<AccountsRepository>();
  Future<Either<Failure, void>> call({required AccountEntity account}) => 
      _repo.updateAccount(account: account);
}

@lazySingleton
class DeleteAccount {
  final AccountsRepository _repo = getIt<AccountsRepository>();
  Future<Either<Failure, void>> call({required int accountId, required String uid}) => 
      _repo.deleteAccount(accountId: accountId, uid: uid);
}

@lazySingleton
class SetDefaultAccount {
  final AccountsRepository _repo = getIt<AccountsRepository>();
  Future<Either<Failure, void>> call({required int accountId, required String uid}) => 
      _repo.setDefaultAccount(accountId: accountId, uid: uid);
}

@lazySingleton
class IsAccountInUse {
  final AccountsRepository _repo = getIt<AccountsRepository>();
  Future<Either<Failure, bool>> call({required int accountId, required String uid}) => 
      _repo.isAccountInUse(accountId: accountId, uid: uid);
}


