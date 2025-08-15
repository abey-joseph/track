// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionTagModelImpl _$$TransactionTagModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionTagModelImpl(
      transactionId: (json['transaction_id'] as num).toInt(),
      tagId: (json['tag_id'] as num).toInt(),
    );

Map<String, dynamic> _$$TransactionTagModelImplToJson(
        _$TransactionTagModelImpl instance) =>
    <String, dynamic>{
      'transaction_id': instance.transactionId,
      'tag_id': instance.tagId,
    };
