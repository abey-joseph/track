import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

enum CategoryTypeModel { 
  @JsonValue('EXPENSE')
  expense, 
  @JsonValue('INCOME')
  income 
}

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    @JsonKey(name: 'category_id') int? categoryId,
    required String uid,
    required String name,
    required CategoryTypeModel type,
    @JsonKey(name: 'parent_id') int? parentId,
    String? icon,
    @JsonKey(name: 'sort_order') @Default(0) int sortOrder,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
