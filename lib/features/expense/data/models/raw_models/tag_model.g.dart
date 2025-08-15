// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TagModelImpl _$$TagModelImplFromJson(Map<String, dynamic> json) =>
    _$TagModelImpl(
      tagId: (json['tag_id'] as num?)?.toInt(),
      uid: json['uid'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$TagModelImplToJson(_$TagModelImpl instance) =>
    <String, dynamic>{
      'tag_id': instance.tagId,
      'uid': instance.uid,
      'name': instance.name,
    };
