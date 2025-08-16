import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/core/services/logging_service.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/features/expense/domain/entities/category_entity.dart';
import 'package:track/features/expense/domain/repo/categories_repository.dart';

@lazySingleton
class GetCategories {
  final CategoriesRepository _repo = getIt<CategoriesRepository>();
  
  Future<Either<Failure, List<CategoryEntity>>> call({required String uid}) async {
    final stopwatch = Stopwatch()..start();
    logger.info('Executing GetCategories use case', tag: 'UseCases');
    final result = await _repo.getCategories(uid: uid);
    stopwatch.stop();
    result.fold(
      (failure) {
        logger.logFailure(failure, operation: 'GetCategoriesUseCase', userId: uid, context: {'durationMs': stopwatch.elapsed.inMilliseconds});
      },
      (categories) {
        logger.logSuccess('GetCategoriesUseCase', userId: uid, context: {'categoryCount': categories.length, 'durationMs': stopwatch.elapsed.inMilliseconds});
      },
    );
    return result;
  }
}


