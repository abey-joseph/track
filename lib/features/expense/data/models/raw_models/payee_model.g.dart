// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PayeeModelImpl _$$PayeeModelImplFromJson(Map<String, dynamic> json) =>
    _$PayeeModelImpl(
      payeeId: (json['payee_id'] as num?)?.toInt(),
      uid: json['uid'] as String,
      name: json['name'] as String,
      normalized: json['normalized'] as String?,
    );

Map<String, dynamic> _$$PayeeModelImplToJson(_$PayeeModelImpl instance) =>
    <String, dynamic>{
      'payee_id': instance.payeeId,
      'uid': instance.uid,
      'name': instance.name,
      'normalized': instance.normalized,
    };
