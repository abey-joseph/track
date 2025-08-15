import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget_rule_model.freezed.dart';
part 'budget_rule_model.g.dart';

@freezed
class BudgetRuleModel with _$BudgetRuleModel {
  const factory BudgetRuleModel({
    @JsonKey(name: 'rule_id') int? ruleId,
    @JsonKey(name: 'budget_id') required int budgetId,
    @Default(true) bool include,
    @JsonKey(name: 'category_id') int? categoryId,
    @JsonKey(name: 'account_id') int? accountId,
    @JsonKey(name: 'tag_id') int? tagId,
  }) = _BudgetRuleModel;

  factory BudgetRuleModel.fromJson(Map<String, dynamic> json) =>
      _$BudgetRuleModelFromJson(json);
}
