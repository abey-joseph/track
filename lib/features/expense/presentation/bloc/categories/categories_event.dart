part of 'categories_bloc.dart';

@freezed
class CategoriesEvent with _$CategoriesEvent {
  const factory CategoriesEvent.load({required String uid}) = _CategoriesLoad;
  const factory CategoriesEvent.add({required CategoryEntity category}) = _CategoriesAdd;
  const factory CategoriesEvent.update({required CategoryEntity category}) = _CategoriesUpdate;
  const factory CategoriesEvent.delete({required int categoryId, required String uid}) = _CategoriesDelete;
  const factory CategoriesEvent.reload({required String uid}) = _CategoriesReload;
}


