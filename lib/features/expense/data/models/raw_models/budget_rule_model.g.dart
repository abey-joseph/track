// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_rule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BudgetRuleModelImpl _$$BudgetRuleModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BudgetRuleModelImpl(
      ruleId: (json['rule_id'] as num?)?.toInt(),
      budgetId: (json['budget_id'] as num).toInt(),
      include: json['include'] as bool? ?? true,
      categoryId: (json['category_id'] as num?)?.toInt(),
      accountId: (json['account_id'] as num?)?.toInt(),
      tagId: (json['tag_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BudgetRuleModelImplToJson(
        _$BudgetRuleModelImpl instance) =>
    <String, dynamic>{
      'rule_id': instance.ruleId,
      'budget_id': instance.budgetId,
      'include': instance.include,
      'category_id': instance.categoryId,
      'account_id': instance.accountId,
      'tag_id': instance.tagId,
    };
