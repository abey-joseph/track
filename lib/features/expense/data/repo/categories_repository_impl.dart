import 'dart:developer' as dev;
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/core/utils/either_utils.dart';
import 'package:track/features/expense/data/data_sources/categories_local_data_source.dart';
import 'package:track/features/expense/domain/entities/category_entity.dart';
import 'package:track/features/expense/domain/repo/categories_repository.dart';

@LazySingleton(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesLocalDataSource local;
  CategoriesRepositoryImpl(this.local);

  Database get _db => local.db;

  @override
  Future<Either<Failure, void>> addCategory({required CategoryEntity category}) async {
    try {
      dev.log('[CategoriesRepo] addCategory name=${category.name} type=${category.type}');
      await _db.insert('categories', {
        'uid': category.uid,
        'name': category.name,
        'type': category.type == CategoryType.income ? 'INCOME' : 'EXPENSE',
        'parent_id': category.parentId,
        'icon': category.icon,
        'sort_order': category.sortOrder,
      });
      
      return EitherUtils.right(null);
    } catch (e, stackTrace) {
      dev.log('[CategoriesRepo] addCategory error: $e');
      return EitherUtils.left(
        DatabaseFailure(
          'Failed to add category',
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories({required String uid}) async {
    try {
      dev.log('[CategoriesRepo] getCategories uid=$uid');
      final rows = await _db.query('categories', where: 'uid = ?', whereArgs: [uid]);
      final categories = rows
          .map((r) => CategoryEntity(
                categoryId: r['category_id'] as int?,
                uid: (r['uid'] as String?) ?? '',
                name: (r['name'] as String?) ?? '',
                type: ((r['type'] as String?) ?? 'EXPENSE').toUpperCase() == 'INCOME'
                    ? CategoryType.income
                    : CategoryType.expense,
                parentId: r['parent_id'] as int?,
                icon: r['icon'] as String?,
                sortOrder: (r['sort_order'] as int?) ?? 0,
              ))
          .toList();
      
      return EitherUtils.right(categories);
    } catch (e, stackTrace) {
      dev.log('[CategoriesRepo] getCategories error: $e');
      return EitherUtils.left(
        DatabaseFailure(
          'Failed to fetch categories',
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateCategory({required CategoryEntity category}) async {
    try {
      dev.log('[CategoriesRepo] updateCategory id=${category.categoryId}');
      await _db.update(
        'categories',
        {
          'uid': category.uid,
          'name': category.name,
          'type': category.type == CategoryType.income ? 'INCOME' : 'EXPENSE',
          'parent_id': category.parentId,
          'icon': category.icon,
          'sort_order': category.sortOrder,
        },
        where: 'category_id = ?',
        whereArgs: [category.categoryId],
      );
      
      return EitherUtils.right(null);
    } catch (e, stackTrace) {
      dev.log('[CategoriesRepo] updateCategory error: $e');
      return EitherUtils.left(
        DatabaseFailure(
          'Failed to update category',
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteCategory({required int categoryId, required String uid}) async {
    try {
      dev.log('[CategoriesRepo] deleteCategory id=$categoryId');
      await _db.delete(
        'categories',
        where: 'category_id = ? AND uid = ?',
        whereArgs: [categoryId, uid],
      );
      
      return EitherUtils.right(null);
    } catch (e, stackTrace) {
      dev.log('[CategoriesRepo] deleteCategory error: $e');
      return EitherUtils.left(
        DatabaseFailure(
          'Failed to delete category',
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> isCategoryInUse({required int categoryId, required String uid}) async {
    try {
      dev.log('[CategoriesRepo] isCategoryInUse id=$categoryId');
      final result = await _db.query(
        'transactions',
        where: 'category_id = ? AND uid = ?',
        whereArgs: [categoryId, uid],
        limit: 1,
      );
      return EitherUtils.right(result.isNotEmpty);
    } catch (e, stackTrace) {
      dev.log('[CategoriesRepo] isCategoryInUse error: $e');
      return EitherUtils.left(
        DatabaseFailure(
          'Failed to check if category is in use',
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }
}


