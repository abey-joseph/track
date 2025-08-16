import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/core/failures/expense_failures.dart';
import 'package:track/core/services/logging_service.dart';
import 'package:track/core/utils/either_utils.dart';
import 'package:track/features/expense/data/data_sources/categories_local_data_source.dart';
import 'package:track/features/expense/data/models/raw_models/category_model.dart';
import 'package:track/features/expense/domain/entities/category_entity.dart';
import 'package:track/features/expense/domain/repo/categories_repository.dart';

@LazySingleton(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesLocalDataSource local;
  CategoriesRepositoryImpl(this.local);

  Database get _db => local.db;

  // --- Mapping helpers ---
  CategoryModel _categoryEntityToModel(CategoryEntity entity) {
    return CategoryModel(
      categoryId: entity.categoryId,
      uid: entity.uid,
      name: entity.name,
      type: _mapCategoryTypeToModel(entity.type),
      parentId: entity.parentId,
      icon: entity.icon,
      sortOrder: entity.sortOrder,
    );
  }

  CategoryEntity _categoryModelToEntity(CategoryModel model) {
    return CategoryEntity(
      categoryId: model.categoryId,
      uid: model.uid,
      name: model.name,
      type: _mapCategoryTypeModelToEntity(model.type),
      parentId: model.parentId,
      icon: model.icon,
      sortOrder: model.sortOrder,
    );
  }

  CategoryTypeModel _mapCategoryTypeToModel(CategoryType type) {
    switch (type) {
      case CategoryType.expense:
        return CategoryTypeModel.expense;
      case CategoryType.income:
        return CategoryTypeModel.income;
    }
  }

  CategoryType _mapCategoryTypeModelToEntity(CategoryTypeModel typeModel) {
    switch (typeModel) {
      case CategoryTypeModel.expense:
        return CategoryType.expense;
      case CategoryTypeModel.income:
        return CategoryType.income;
    }
  }

  @override
  Future<Either<Failure, void>> addCategory({required CategoryEntity category}) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      logger.info('Adding category: ${category.name}', tag: 'CategoriesRepo');
      
      final categoryModel = _categoryEntityToModel(category);
      await _db.insert('categories', categoryModel.toJson());
      
      stopwatch.stop();
      logger.logSuccess(
        'Add category',
        userId: category.uid,
        context: {'categoryName': category.name, 'categoryType': category.type.toString()},
      );
      logger.logPerformance(
        'Add category',
        duration: stopwatch.elapsed,
        userId: category.uid,
      );
      
      return EitherUtils.right(null);
    } catch (e, stackTrace) {
      stopwatch.stop();
      logger.logFailure(
        CategoryFailure(
          'Failed to add category: ${category.name}',
          categoryId: category.categoryId?.toString(),
          categoryName: category.name,
          categoryType: category.type.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
        operation: 'addCategory',
        userId: category.uid,
        context: {'categoryName': category.name, 'durationMs': stopwatch.elapsed.inMilliseconds},
      );
      
      return EitherUtils.left(
        CategoryFailure(
          'Failed to add category',
          categoryId: category.categoryId?.toString(),
          categoryName: category.name,
          categoryType: category.type.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories({required String uid}) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      logger.info('Fetching categories for user: $uid', tag: 'CategoriesRepo');
      
      final rows = await _db.query('categories', where: 'uid = ?', whereArgs: [uid]);
      final categories = rows.map((r) => _categoryModelToEntity(CategoryModel.fromJson(r))).toList();
      
      stopwatch.stop();
      logger.logSuccess(
        'Get categories',
        userId: uid,
        context: {'categoryCount': categories.length, 'durationMs': stopwatch.elapsed.inMilliseconds},
      );
      logger.logPerformance(
        'Get categories',
        duration: stopwatch.elapsed,
        userId: uid,
      );
      logger.logDatabaseOperation(
        'SELECT',
        table: 'categories',
        userId: uid,
        duration: stopwatch.elapsed,
      );
      
      return EitherUtils.right(categories);
    } catch (e, stackTrace) {
      stopwatch.stop();
      logger.logFailure(
        CategoryFailure(
          'Failed to fetch categories',
          cause: e,
          stackTrace: stackTrace,
        ),
        operation: 'getCategories',
        userId: uid,
        context: {'durationMs': stopwatch.elapsed.inMilliseconds},
      );
      
      return EitherUtils.left(
        CategoryFailure(
          'Failed to fetch categories',
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateCategory({required CategoryEntity category}) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      logger.info('Updating category: ${category.name}', tag: 'CategoriesRepo');
      
      final categoryModel = _categoryEntityToModel(category);
      await _db.update('categories', categoryModel.toJson(), where: 'category_id = ?', whereArgs: [category.categoryId]);
      
      stopwatch.stop();
      logger.logSuccess(
        'Update category',
        userId: category.uid,
        context: {'categoryId': category.categoryId, 'categoryName': category.name},
      );
      logger.logPerformance(
        'Update category',
        duration: stopwatch.elapsed,
        userId: category.uid,
      );
      
      return EitherUtils.right(null);
    } catch (e, stackTrace) {
      stopwatch.stop();
      logger.logFailure(
        CategoryFailure(
          'Failed to update category: ${category.name}',
          categoryId: category.categoryId?.toString(),
          categoryName: category.name,
          categoryType: category.type.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
        operation: 'updateCategory',
        userId: category.uid,
        context: {'categoryId': category.categoryId, 'durationMs': stopwatch.elapsed.inMilliseconds},
      );
      
      return EitherUtils.left(
        CategoryFailure(
          'Failed to update category',
          categoryId: category.categoryId?.toString(),
          categoryName: category.name,
          categoryType: category.type.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteCategory({required int categoryId, required String uid}) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      logger.info('Deleting category: $categoryId', tag: 'CategoriesRepo');
      
      await _db.delete(
        'categories',
        where: 'category_id = ? AND uid = ?',
        whereArgs: [categoryId, uid],
      );
      
      stopwatch.stop();
      logger.logSuccess(
        'Delete category',
        userId: uid,
        context: {'categoryId': categoryId},
      );
      logger.logPerformance(
        'Delete category',
        duration: stopwatch.elapsed,
        userId: uid,
      );
      
      return EitherUtils.right(null);
    } catch (e, stackTrace) {
      stopwatch.stop();
      logger.logFailure(
        CategoryFailure(
          'Failed to delete category',
          categoryId: categoryId.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
        operation: 'deleteCategory',
        userId: uid,
        context: {'categoryId': categoryId, 'durationMs': stopwatch.elapsed.inMilliseconds},
      );
      
      return EitherUtils.left(
        CategoryFailure(
          'Failed to delete category',
          categoryId: categoryId.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> isCategoryInUse({required int categoryId, required String uid}) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      logger.info('Checking if category is in use: $categoryId', tag: 'CategoriesRepo');
      
      final result = await _db.query(
        'transactions',
        where: 'category_id = ? AND uid = ?',
        whereArgs: [categoryId, uid],
        limit: 1,
      );
      
      final isInUse = result.isNotEmpty;
      stopwatch.stop();
      
      logger.logSuccess(
        'Check category in use',
        userId: uid,
        context: {'categoryId': categoryId, 'isInUse': isInUse},
      );
      logger.logPerformance(
        'Check category in use',
        duration: stopwatch.elapsed,
        userId: uid,
      );
      
      return EitherUtils.right(isInUse);
    } catch (e, stackTrace) {
      stopwatch.stop();
      logger.logFailure(
        CategoryFailure(
          'Failed to check if category is in use',
          categoryId: categoryId.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
        operation: 'isCategoryInUse',
        userId: uid,
        context: {'categoryId': categoryId, 'durationMs': stopwatch.elapsed.inMilliseconds},
      );
      
      return EitherUtils.left(
        CategoryFailure(
          'Failed to check if category is in use',
          categoryId: categoryId.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }
}


