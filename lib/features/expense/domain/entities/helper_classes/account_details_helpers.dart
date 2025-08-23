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
