import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/core/services/logging_service.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/features/expense/domain/entities/account_entity.dart';
import 'package:track/features/expense/domain/repo/accounts_repository.dart';

@lazySingleton
class AddAccount {
  final AccountsRepository _repo = getIt<AccountsRepository>();
  Future<Either<Failure, void>> call({required AccountEntity account}) async {
    final stopwatch = Stopwatch()..start();
    logger.info('Executing AddAccount use case', tag: 'UseCases');
    final result = await _repo.addAccount(account: account);
    stopwatch.stop();
    result.fold(
      (failure) {
        logger.logFailure(failure, operation: 'AddAccountUseCase', userId: account.uid, context: {'durationMs': stopwatch.elapsed.inMilliseconds});
      },
      (_) {
        logger.logSuccess('AddAccountUseCase', userId: account.uid, context: {'durationMs': stopwatch.elapsed.inMilliseconds});
      },
    );
    return result;
  }
}

@lazySingleton
class UpdateAccount {
  final AccountsRepository _repo = getIt<AccountsRepository>();
  Future<Either<Failure, void>> call({required AccountEntity account}) async {
    final stopwatch = Stopwatch()..start();
    logger.info('Executing UpdateAccount use case', tag: 'UseCases');
    final result = await _repo.updateAccount(account: account);
    stopwatch.stop();
    result.fold(
      (failure) {
        logger.logFailure(failure, operation: 'UpdateAccountUseCase', userId: account.uid, context: {'durationMs': stopwatch.elapsed.inMilliseconds});
      },
      (_) {
        logger.logSuccess('UpdateAccountUseCase', userId: account.uid, context: {'durationMs': stopwatch.elapsed.inMilliseconds});
      },
    );
    return result;
  }
}

@lazySingleton
class DeleteAccount {
  final AccountsRepository _repo = getIt<AccountsRepository>();
  Future<Either<Failure, void>> call({required int accountId, required String uid}) async {
    final stopwatch = Stopwatch()..start();
    logger.info('Executing DeleteAccount use case', tag: 'UseCases');
    final result = await _repo.deleteAccount(accountId: accountId, uid: uid);
    stopwatch.stop();
    result.fold(
      (failure) {
        logger.logFailure(failure, operation: 'DeleteAccountUseCase', userId: uid, context: {'accountId': accountId, 'durationMs': stopwatch.elapsed.inMilliseconds});
      },
      (_) {
        logger.logSuccess('DeleteAccountUseCase', userId: uid, context: {'accountId': accountId, 'durationMs': stopwatch.elapsed.inMilliseconds});
      },
    );
    return result;
  }
}

@lazySingleton
class SetDefaultAccount {
  final AccountsRepository _repo = getIt<AccountsRepository>();
  Future<Either<Failure, void>> call({required int accountId, required String uid}) async {
    final stopwatch = Stopwatch()..start();
    logger.info('Executing SetDefaultAccount use case', tag: 'UseCases');
    final result = await _repo.setDefaultAccount(accountId: accountId, uid: uid);
    stopwatch.stop();
    result.fold(
      (failure) {
        logger.logFailure(failure, operation: 'SetDefaultAccountUseCase', userId: uid, context: {'accountId': accountId, 'durationMs': stopwatch.elapsed.inMilliseconds});
      },
      (_) {
        logger.logSuccess('SetDefaultAccountUseCase', userId: uid, context: {'accountId': accountId, 'durationMs': stopwatch.elapsed.inMilliseconds});
      },
    );
    return result;
  }
}

@lazySingleton
class IsAccountInUse {
  final AccountsRepository _repo = getIt<AccountsRepository>();
  Future<Either<Failure, bool>> call({required int accountId, required String uid}) async {
    final stopwatch = Stopwatch()..start();
    logger.info('Executing IsAccountInUse use case', tag: 'UseCases');
    final result = await _repo.isAccountInUse(accountId: accountId, uid: uid);
    stopwatch.stop();
    result.fold(
      (failure) {
        logger.logFailure(failure, operation: 'IsAccountInUseUseCase', userId: uid, context: {'accountId': accountId, 'durationMs': stopwatch.elapsed.inMilliseconds});
      },
      (isInUse) {
        logger.logSuccess('IsAccountInUseUseCase', userId: uid, context: {'isInUse': isInUse, 'durationMs': stopwatch.elapsed.inMilliseconds});
      },
    );
    return result;
  }
}


