enum BudgetPeriodType { month, week, year, custom }

class BudgetEntity {
  final int? budgetId;
  final String uid;
  final String name;
  final String currency;
  final BudgetPeriodType periodType;
  final DateTime startOn;
  final double amount;
  final bool includeTransfers;
  final DateTime createdAt;

  const BudgetEntity({
    this.budgetId,
    required this.uid,
    required this.name,
    required this.currency,
    required this.periodType,
    required this.startOn,
    required this.amount,
    this.includeTransfers = false,
    required this.createdAt,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BudgetEntity &&
        other.budgetId == budgetId &&
        other.uid == uid &&
        other.name == name &&
        other.currency == currency &&
        other.periodType == periodType &&
        other.startOn == startOn &&
        other.amount == amount &&
        other.includeTransfers == includeTransfers &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return budgetId.hashCode ^
        uid.hashCode ^
        name.hashCode ^
        currency.hashCode ^
        periodType.hashCode ^
        startOn.hashCode ^
        amount.hashCode ^
        includeTransfers.hashCode ^
        createdAt.hashCode;
  }

  BudgetEntity copyWith({
    int? budgetId,
    String? uid,
    String? name,
    String? currency,
    BudgetPeriodType? periodType,
    DateTime? startOn,
    double? amount,
    bool? includeTransfers,
    DateTime? createdAt,
  }) {
    return BudgetEntity(
      budgetId: budgetId ?? this.budgetId,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      currency: currency ?? this.currency,
      periodType: periodType ?? this.periodType,
      startOn: startOn ?? this.startOn,
      amount: amount ?? this.amount,
      includeTransfers: includeTransfers ?? this.includeTransfers,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
