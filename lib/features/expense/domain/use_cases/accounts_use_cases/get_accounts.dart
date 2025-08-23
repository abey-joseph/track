import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/core/services/logging_service.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/features/expense/domain/entities/raw_entities/account_entity.dart';
import 'package:track/features/expense/domain/repo/accounts_repository.dart';

@lazySingleton
class GetAccounts {
  final AccountsRepository _repo = getIt<AccountsRepository>();

  Future<Either<Failure, List<AccountEntity>>> call(
      {required String uid}) async {
    final stopwatch = Stopwatch()..start();
    logger.info('Executing GetAccounts use case', tag: 'UseCases');
    final result = await _repo.getAccounts(uid: uid);
    stopwatch.stop();
    result.fold(
      (failure) {
        logger.logFailure(failure,
            operation: 'GetAccountsUseCase',
            userId: uid,
            context: {'durationMs': stopwatch.elapsed.inMilliseconds});
      },
      (accounts) {
        logger.logSuccess('GetAccountsUseCase', userId: uid, context: {
          'accountCount': accounts.length,
          'durationMs': stopwatch.elapsed.inMilliseconds
        });
      },
    );
    return result;
  }

  Future<Either<Failure, AccountEntity>> getAccount(
      {required String uid, required int accountId}) async {
    final stopwatch = Stopwatch()..start();
    logger.info('Executing GetAccount use case', tag: 'UseCases');
    final result = await _repo.getAccount(uid: uid, accountId: accountId);
    stopwatch.stop();
    result.fold(
      (failure) {
        logger.logFailure(failure,
            operation: 'GetAccountUseCase',
            userId: uid,
            context: {'durationMs': stopwatch.elapsed.inMilliseconds});
      },
      (account) {
        logger.logSuccess('GetAccountUseCase', userId: uid, context: {
          'accountId': account.accountId,
          'durationMs': stopwatch.elapsed.inMilliseconds
        });
      },
    );
    return result;
  }
}
