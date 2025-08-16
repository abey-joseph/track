import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/features/expense/domain/entities/category_entity.dart';
import 'package:track/features/expense/domain/repo/categories_repository.dart';

@lazySingleton
class GetCategories {
  final CategoriesRepository _repo = getIt<CategoriesRepository>();
  
  Future<Either<Failure, List<CategoryEntity>>> call({required String uid}) => 
      _repo.getCategories(uid: uid);
}


