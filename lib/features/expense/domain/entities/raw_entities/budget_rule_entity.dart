class BudgetRuleEntity {
  final int? ruleId;
  final int budgetId;
  final bool include;
  final int? categoryId;
  final int? accountId;
  final int? tagId;

  const BudgetRuleEntity({
    this.ruleId,
    required this.budgetId,
    this.include = true,
    this.categoryId,
    this.accountId,
    this.tagId,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BudgetRuleEntity &&
        other.ruleId == ruleId &&
        other.budgetId == budgetId &&
        other.include == include &&
        other.categoryId == categoryId &&
        other.accountId == accountId &&
        other.tagId == tagId;
  }

  @override
  int get hashCode {
    return ruleId.hashCode ^
        budgetId.hashCode ^
        include.hashCode ^
        categoryId.hashCode ^
        accountId.hashCode ^
        tagId.hashCode;
  }

  BudgetRuleEntity copyWith({
    int? ruleId,
    int? budgetId,
    bool? include,
    int? categoryId,
    int? accountId,
    int? tagId,
  }) {
    return BudgetRuleEntity(
      ruleId: ruleId ?? this.ruleId,
      budgetId: budgetId ?? this.budgetId,
      include: include ?? this.include,
      categoryId: categoryId ?? this.categoryId,
      accountId: accountId ?? this.accountId,
      tagId: tagId ?? this.tagId,
    );
  }
}
