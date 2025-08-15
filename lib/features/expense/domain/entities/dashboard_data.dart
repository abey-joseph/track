import 'package:track/features/expense/domain/entities/transaction_entity.dart';

class DashboardData {
  final List<TransactionEntity> recentTransactions;
  final List<TransactionEntity> todayTransactions;
  final int transactionCountInPeriod;
  final int periodDays;

  const DashboardData({
    required this.recentTransactions,
    required this.todayTransactions,
    required this.transactionCountInPeriod,
    required this.periodDays,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DashboardData &&
        other.recentTransactions == recentTransactions &&
        other.todayTransactions == todayTransactions &&
        other.transactionCountInPeriod == transactionCountInPeriod &&
        other.periodDays == periodDays;
  }

  @override
  int get hashCode {
    return recentTransactions.hashCode ^
        todayTransactions.hashCode ^
        transactionCountInPeriod.hashCode ^
        periodDays.hashCode;
  }

  DashboardData copyWith({
    List<TransactionEntity>? recentTransactions,
    List<TransactionEntity>? todayTransactions,
    int? transactionCountInPeriod,
    int? periodDays,
  }) {
    return DashboardData(
      recentTransactions: recentTransactions ?? this.recentTransactions,
      todayTransactions: todayTransactions ?? this.todayTransactions,
      transactionCountInPeriod: transactionCountInPeriod ?? this.transactionCountInPeriod,
      periodDays: periodDays ?? this.periodDays,
    );
  }
}
