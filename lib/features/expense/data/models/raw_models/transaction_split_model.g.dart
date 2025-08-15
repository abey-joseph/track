// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_split_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionSplitModelImpl _$$TransactionSplitModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionSplitModelImpl(
      splitId: (json['split_id'] as num?)?.toInt(),
      transactionId: (json['transaction_id'] as num).toInt(),
      categoryId: (json['category_id'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$TransactionSplitModelImplToJson(
        _$TransactionSplitModelImpl instance) =>
    <String, dynamic>{
      'split_id': instance.splitId,
      'transaction_id': instance.transactionId,
      'category_id': instance.categoryId,
      'amount': instance.amount,
      'note': instance.note,
    };
