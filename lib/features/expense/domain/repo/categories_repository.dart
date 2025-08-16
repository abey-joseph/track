
import 'package:dartz/dartz.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/features/expense/domain/entities/category_entity.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories({required String uid});
  Future<Either<Failure, void>> addCategory({required CategoryEntity category});
  Future<Either<Failure, void>> updateCategory({required CategoryEntity category});
  Future<Either<Failure, void>> deleteCategory({required int categoryId, required String uid});
  Future<Either<Failure, bool>> isCategoryInUse({required int categoryId, required String uid});
}


