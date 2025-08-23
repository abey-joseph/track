import 'package:track/features/expense/domain/entities/raw_entities/account_entity.dart';
import 'package:track/features/expense/domain/entities/helper_classes/account_details_helpers.dart';
import 'package:track/features/expense/domain/entities/raw_entities/transaction_entity.dart';

// Data models for account details
class AccountDetailsSummary {
  final AccountEntity account;
  final AccountActivityInfoBasedOnFilter accountActivityInfoBasedOnFilter;
  final AccountTotals totals;
  final AccountCounts counts;
  final DonutChartData donutData;
  final Map<DateTime, List<TransactionEntity>> groupedTransactions;

  AccountDetailsSummary({
    required this.account,
    required this.accountActivityInfoBasedOnFilter,
    required this.totals,
    required this.counts,
    required this.donutData,
    required this.groupedTransactions,
  });
}

class AccountActivityInfoBasedOnFilter {
  final double currentBalance;
  final double totalIncoming;
  final double totalOutgoing;
  final double netAmount;
  final int totalTransactions;
  final int incomingCount;
  final int outgoingCount;

  AccountActivityInfoBasedOnFilter({
    required this.currentBalance,
    required this.totalIncoming,
    required this.totalOutgoing,
    required this.netAmount,
    required this.totalTransactions,
    required this.incomingCount,
    required this.outgoingCount,
  });
}
