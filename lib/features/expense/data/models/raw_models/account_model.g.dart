// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountModelImpl _$$AccountModelImplFromJson(Map<String, dynamic> json) =>
    _$AccountModelImpl(
      accountId: (json['account_id'] as num?)?.toInt(),
      uid: json['uid'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$AccountTypeModelEnumMap, json['type']),
      currency: json['currency'] as String,
      isArchived: json['is_archived'] as bool? ?? false,
      isDefault: json['is_default'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$AccountModelImplToJson(_$AccountModelImpl instance) =>
    <String, dynamic>{
      'account_id': instance.accountId,
      'uid': instance.uid,
      'name': instance.name,
      'type': _$AccountTypeModelEnumMap[instance.type]!,
      'currency': instance.currency,
      'is_archived': instance.isArchived,
      'is_default': instance.isDefault,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$AccountTypeModelEnumMap = {
  AccountTypeModel.cash: 'cash',
  AccountTypeModel.bank: 'bank',
  AccountTypeModel.card: 'card',
  AccountTypeModel.ewallet: 'ewallet',
  AccountTypeModel.other: 'other',
};
