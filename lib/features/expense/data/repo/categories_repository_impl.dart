import 'dart:developer' as dev;
import 'package:injectable/injectable.dart';
import 'package:track/features/expense/data/data_sources/categories_local_data_source.dart';
import 'package:track/features/expense/domain/entities/category_entity.dart';
import 'package:track/features/expense/domain/repo/categories_repository.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesLocalDataSource local;
  CategoriesRepositoryImpl(this.local);

  Database get _db => local.db;

  @override
  Future<void> addCategory({required CategoryEntity category}) async {
    dev.log('[CategoriesRepo] addCategory name=${category.name} type=${category.type}');
    await _db.insert('categories', {
      'uid': category.uid,
      'name': category.name,
      'type': category.type == CategoryType.income ? 'INCOME' : 'EXPENSE',
      'parent_id': category.parentId,
      'icon': category.icon,
      'sort_order': category.sortOrder,
    });
  }

  @override
  Future<List<CategoryEntity>> getCategories({required String uid}) async {
    dev.log('[CategoriesRepo] getCategories uid=$uid');
    final rows = await _db.query('categories', where: 'uid = ?', whereArgs: [uid]);
    return rows
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
  }

  @override
  Future<void> updateCategory({required CategoryEntity category}) async {
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
  }

  @override
  Future<void> deleteCategory({required int categoryId, required String uid}) async {
    dev.log('[CategoriesRepo] deleteCategory id=$categoryId');
    await _db.delete(
      'categories',
      where: 'category_id = ? AND uid = ?',
      whereArgs: [categoryId, uid],
    );
  }

  @override
  Future<bool> isCategoryInUse({required int categoryId, required String uid}) async {
    dev.log('[CategoriesRepo] isCategoryInUse id=$categoryId');
    final result = await _db.query(
      'transactions',
      where: 'category_id = ? AND uid = ?',
      whereArgs: [categoryId, uid],
      limit: 1,
    );
    return result.isNotEmpty;
  }
}


