import 'package:injectable/injectable.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/features/expense/domain/entities/category_entity.dart';
import 'package:track/features/expense/domain/repo/categories_repository.dart';

@lazySingleton
class AddCategory {
  final CategoriesRepository _repo = getIt<CategoriesRepository>();
  Future<void> call({required CategoryEntity category}) => _repo.addCategory(category: category);
}

@lazySingleton
class UpdateCategory {
  final CategoriesRepository _repo = getIt<CategoriesRepository>();
  Future<void> call({required CategoryEntity category}) => _repo.updateCategory(category: category);
}

@lazySingleton
class DeleteCategory {
  final CategoriesRepository _repo = getIt<CategoriesRepository>();
  Future<void> call({required int categoryId, required String uid}) => _repo.deleteCategory(categoryId: categoryId, uid: uid);
}

@lazySingleton
class IsCategoryInUse {
  final CategoriesRepository _repo = getIt<CategoriesRepository>();
  Future<bool> call({required int categoryId, required String uid}) => _repo.isCategoryInUse(categoryId: categoryId, uid: uid);
}


