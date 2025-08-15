// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      categoryId: (json['category_id'] as num?)?.toInt(),
      uid: json['uid'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$CategoryTypeModelEnumMap, json['type']),
      parentId: (json['parent_id'] as num?)?.toInt(),
      icon: json['icon'] as String?,
      sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'uid': instance.uid,
      'name': instance.name,
      'type': _$CategoryTypeModelEnumMap[instance.type]!,
      'parent_id': instance.parentId,
      'icon': instance.icon,
      'sort_order': instance.sortOrder,
    };

const _$CategoryTypeModelEnumMap = {
  CategoryTypeModel.expense: 'expense',
  CategoryTypeModel.income: 'income',
};
