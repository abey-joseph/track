// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BudgetModelImpl _$$BudgetModelImplFromJson(Map<String, dynamic> json) =>
    _$BudgetModelImpl(
      budgetId: (json['budget_id'] as num?)?.toInt(),
      uid: json['uid'] as String,
      name: json['name'] as String,
      currency: json['currency'] as String,
      periodType:
          $enumDecode(_$BudgetPeriodTypeModelEnumMap, json['period_type']),
      startOn: DateTime.parse(json['start_on'] as String),
      amount: (json['amount'] as num).toDouble(),
      includeTransfers: json['include_transfers'] == null
          ? false
          : const BoolConverter().fromJson(json['include_transfers']),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$BudgetModelImplToJson(_$BudgetModelImpl instance) =>
    <String, dynamic>{
      'budget_id': instance.budgetId,
      'uid': instance.uid,
      'name': instance.name,
      'currency': instance.currency,
      'period_type': _$BudgetPeriodTypeModelEnumMap[instance.periodType]!,
      'start_on': instance.startOn.toIso8601String(),
      'amount': instance.amount,
      'include_transfers':
          const BoolConverter().toJson(instance.includeTransfers),
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$BudgetPeriodTypeModelEnumMap = {
  BudgetPeriodTypeModel.month: 'MONTH',
  BudgetPeriodTypeModel.week: 'WEEK',
  BudgetPeriodTypeModel.year: 'YEAR',
  BudgetPeriodTypeModel.custom: 'CUSTOM',
};
