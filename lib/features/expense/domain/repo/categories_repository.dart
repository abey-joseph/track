
import 'package:track/features/expense/domain/entities/category_entity.dart';


abstract class CategoriesRepository {
  Future<List<CategoryEntity>> getCategories({required String uid});
  Future<void> addCategory({required CategoryEntity category});
  Future<void> updateCategory({required CategoryEntity category});
  Future<void> deleteCategory({required int categoryId, required String uid});
  Future<bool> isCategoryInUse({required int categoryId, required String uid});
}


