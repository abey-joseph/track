
class AccountFilter {
  final DateRange dateRange;
  final TransactionFlow flow;
  final DateTime? customStartDate;
  final DateTime? customEndDate;

  const AccountFilter({
    this.dateRange = DateRange.all,
    this.flow = TransactionFlow.all,
    this.customStartDate,
    this.customEndDate,
  });

  AccountFilter copyWith({
    DateRange? dateRange,
    TransactionFlow? flow,
    DateTime? customStartDate,
    DateTime? customEndDate,
  }) {
    return AccountFilter(
      dateRange: dateRange ?? this.dateRange,
      flow: flow ?? this.flow,
      customStartDate: customStartDate ?? this.customStartDate,
      customEndDate: customEndDate ?? this.customEndDate,
    );
  }

  @override
  String toString() {
    return 'AccountFilter(dateRange: $dateRange, flow: $flow, customStartDate: $customStartDate, customEndDate: $customEndDate)';
  }
}

enum DateRange { all, today, thisWeek, thisMonth, custom }
enum TransactionFlow { all, incoming, outgoing }

class AccountTotals {
  final double incoming;
  final double outgoing;
  final double net;
  final double balance;

  const AccountTotals({
    required this.incoming,
    required this.outgoing,
    required this.net,
    required this.balance,
  });
}

class AccountCounts {
  final int total;
  final int incoming;
  final int outgoing;

  const AccountCounts({
    required this.total,
    required this.incoming,
    required this.outgoing,
  });
}

class DonutChartData {
  final double incomingPercentage;
  final double outgoingPercentage;
  final double incomingAmount;
  final double outgoingAmount;

  const DonutChartData({
    required this.incomingPercentage,
    required this.outgoingPercentage,
    required this.incomingAmount,
    required this.outgoingAmount,
  });
}


