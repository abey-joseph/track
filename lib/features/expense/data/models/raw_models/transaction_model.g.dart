// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionModelImpl _$$TransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionModelImpl(
      transactionId: (json['transaction_id'] as num?)?.toInt(),
      uid: json['uid'] as String,
      accountId: (json['account_id'] as num).toInt(),
      type: $enumDecode(_$TransactionTypeModelEnumMap, json['type']),
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      categoryId: (json['category_id'] as num?)?.toInt(),
      payeeId: (json['payee_id'] as num?)?.toInt(),
      note: json['note'] as String?,
      occurredOn: DateTime.parse(json['occurred_on'] as String),
      occurredAt: json['occurred_at'] == null
          ? null
          : DateTime.parse(json['occurred_at'] as String),
      transferGroupId: json['transfer_group_id'] as String?,
      hasSplit: json['has_split'] == null
          ? false
          : const BoolConverter().fromJson(json['has_split']),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$TransactionModelImplToJson(
        _$TransactionModelImpl instance) =>
    <String, dynamic>{
      'transaction_id': instance.transactionId,
      'uid': instance.uid,
      'account_id': instance.accountId,
      'type': _$TransactionTypeModelEnumMap[instance.type]!,
      'amount': instance.amount,
      'currency': instance.currency,
      'category_id': instance.categoryId,
      'payee_id': instance.payeeId,
      'note': instance.note,
      'occurred_on': instance.occurredOn.toIso8601String(),
      'occurred_at': instance.occurredAt?.toIso8601String(),
      'transfer_group_id': instance.transferGroupId,
      'has_split': const BoolConverter().toJson(instance.hasSplit),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$TransactionTypeModelEnumMap = {
  TransactionTypeModel.expense: 'EXPENSE',
  TransactionTypeModel.income: 'INCOME',
  TransactionTypeModel.transfer: 'TRANSFER',
};
