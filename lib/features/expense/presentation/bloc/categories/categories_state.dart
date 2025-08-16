part of 'categories_bloc.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = _CategoriesInitial;
  const factory CategoriesState.loading() = _CategoriesLoading;
  const factory CategoriesState.loaded(List<CategoryEntity> categories) = _CategoriesLoaded;
  const factory CategoriesState.failure(String message) = _CategoriesFailure;
}


