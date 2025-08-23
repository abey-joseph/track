import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/core/services/logging_service.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/features/expense/domain/entities/raw_entities/category_entity.dart';
import 'package:track/features/expense/domain/repo/categories_repository.dart';

@lazySingleton
class AddCategory {
  final CategoriesRepository _repo = getIt<CategoriesRepository>();
  Future<Either<Failure, void>> call({required CategoryEntity category}) async {
    final stopwatch = Stopwatch()..start();
    logger.info('Executing AddCategory use case', tag: 'UseCases');
    final result = await _repo.addCategory(category: category);
    stopwatch.stop();
    result.fold(
      (failure) {
        logger.logFailure(failure, operation: 'AddCategoryUseCase', userId: category.uid, context: {'durationMs': stopwatch.elapsed.inMilliseconds});
      },
      (_) {
        logger.logSuccess('AddCategoryUseCase', userId: category.uid, context: {'durationMs': stopwatch.elapsed.inMilliseconds});
      },
    );
    return result;
  }
}

@lazySingleton
class UpdateCategory {
  final CategoriesRepository _repo = getIt<CategoriesRepository>();
  Future<Either<Failure, void>> call({required CategoryEntity category}) async {
    final stopwatch = Stopwatch()..start();
    logger.info('Executing UpdateCategory use case', tag: 'UseCases');
    final result = await _repo.updateCategory(category: category);
    stopwatch.stop();
    result.fold(
      (failure) {
        logger.logFailure(failure, operation: 'UpdateCategoryUseCase', userId: category.uid, context: {'durationMs': stopwatch.elapsed.inMilliseconds});
      },
      (_) {
        logger.logSuccess('UpdateCategoryUseCase', userId: category.uid, context: {'durationMs': stopwatch.elapsed.inMilliseconds});
      },
    );
    return result;
  }
}

@lazySingleton
class DeleteCategory {
  final CategoriesRepository _repo = getIt<CategoriesRepository>();
  Future<Either<Failure, void>> call({required int categoryId, required String uid}) async {
    final stopwatch = Stopwatch()..start();
    logger.info('Executing DeleteCategory use case', tag: 'UseCases');
    final result = await _repo.deleteCategory(categoryId: categoryId, uid: uid);
    stopwatch.stop();
    result.fold(
      (failure) {
        logger.logFailure(failure, operation: 'DeleteCategoryUseCase', userId: uid, context: {'categoryId': categoryId, 'durationMs': stopwatch.elapsed.inMilliseconds});
      },
      (_) {
        logger.logSuccess('DeleteCategoryUseCase', userId: uid, context: {'categoryId': categoryId, 'durationMs': stopwatch.elapsed.inMilliseconds});
      },
    );
    return result;
  }
}

@lazySingleton
class IsCategoryInUse {
  final CategoriesRepository _repo = getIt<CategoriesRepository>();
  Future<Either<Failure, bool>> call({required int categoryId, required String uid}) async {
    final stopwatch = Stopwatch()..start();
    logger.info('Executing IsCategoryInUse use case', tag: 'UseCases');
    final result = await _repo.isCategoryInUse(categoryId: categoryId, uid: uid);
    stopwatch.stop();
    result.fold(
      (failure) {
        logger.logFailure(failure, operation: 'IsCategoryInUseUseCase', userId: uid, context: {'categoryId': categoryId, 'durationMs': stopwatch.elapsed.inMilliseconds});
      },
      (isInUse) {
        logger.logSuccess('IsCategoryInUseUseCase', userId: uid, context: {'categoryId': categoryId, 'isInUse': isInUse, 'durationMs': stopwatch.elapsed.inMilliseconds});
      },
    );
    return result;
  }
}


