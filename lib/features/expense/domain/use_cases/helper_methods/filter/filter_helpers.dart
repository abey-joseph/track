import 'package:track/features/expense/domain/entities/helper_classes/account_details_helpers.dart';
import 'package:track/features/expense/domain/entities/raw_entities/transaction_entity.dart';
import 'package:track/features/expense/domain/entities/view_entities/misc/expense_filter.dart';

AccountTotals calculateTotals(List<TransactionEntity> transactions,
    {required double currentBalance}) {
  double incoming = 0;
  double outgoing = 0;

  for (final transaction in transactions) {
    if (transaction.type == TransactionType.income) {
      incoming += transaction.amount;
    } else if (transaction.type == TransactionType.expense) {
      outgoing += transaction.amount;
    }
  }

  return AccountTotals(
    incoming: incoming,
    outgoing: outgoing,
    net: incoming - outgoing,
    // current balance is independent of filter; display it directly
    balance: currentBalance,
  );
}

AccountCounts calculateCounts(List<TransactionEntity> transactions) {
  int total = transactions.length;
  int incoming =
      transactions.where((t) => t.type == TransactionType.income).length;
  int outgoing =
      transactions.where((t) => t.type == TransactionType.expense).length;

  return AccountCounts(
    total: total,
    incoming: incoming,
    outgoing: outgoing,
  );
}

DonutChartData generateDonutData(AccountTotals totals) {
  final totalFlow = totals.incoming -
      totals.outgoing; // total magnitude // minus because outgoing is negative
  if (totalFlow == 0) {
    return const DonutChartData(
      incomingPercentage: 0,
      outgoingPercentage: 0,
      incomingAmount: 0,
      outgoingAmount: 0,
    );
  }

  final incomePct = (totals.incoming / totalFlow) * 100;
  final outgoingPct = ((totals.outgoing * -1) / totalFlow) *
      100; // multiply by -1 because outgoing is negative

  return DonutChartData(
    incomingPercentage: incomePct,
    outgoingPercentage: outgoingPct,
    incomingAmount: totals.incoming,
    outgoingAmount: totals.outgoing,
  );
}

Map<DateTime, List<TransactionEntity>> groupTransactionsByDay(
    List<TransactionEntity> transactions) {
  final grouped = <DateTime, List<TransactionEntity>>{};

  for (final transaction in transactions) {
    final day = DateTime(
      transaction.occurredOn.year,
      transaction.occurredOn.month,
      transaction.occurredOn.day,
    );

    if (grouped.containsKey(day)) {
      grouped[day]!.add(transaction);
    } else {
      grouped[day] = [transaction];
    }
  }

  // Sort by date (newest first)
  final sortedKeys = grouped.keys.toList()..sort((a, b) => b.compareTo(a));
  final sortedMap = <DateTime, List<TransactionEntity>>{};

  for (final key in sortedKeys) {
    sortedMap[key] = grouped[key]!;
  }

  return sortedMap;
}

// Helper methods for converting filters to repository parameters
DateTime? getFromDate(AccountFilter filter) {
  switch (filter.dateRange) {
    case DateRange.today:
      final today = DateTime.now();
      return DateTime(today.year, today.month, today.day);
    case DateRange.thisWeek:
      final now = DateTime.now();
      final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
      return DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day);
    case DateRange.thisMonth:
      final now = DateTime.now();
      return DateTime(now.year, now.month, 1);
    case DateRange.custom:
      return filter.customStartDate;
    case DateRange.all:
      return null;
  }
}

DateTime? getToDate(AccountFilter filter) {
  switch (filter.dateRange) {
    case DateRange.today:
      final today = DateTime.now();
      return DateTime(today.year, today.month, today.day, 23, 59, 59);
    case DateRange.thisWeek:
      final now = DateTime.now();
      final endOfWeek = now.add(Duration(days: 7 - now.weekday));
      return DateTime(
          endOfWeek.year, endOfWeek.month, endOfWeek.day, 23, 59, 59);
    case DateRange.custom:
      return filter.customEndDate;
    case DateRange.all:
      return null;
    case DateRange.thisMonth:
      final now = DateTime.now();
      final endOfMonth = DateTime(now.year, now.month + 1, 0);
      return DateTime(
          endOfMonth.year, endOfMonth.month, endOfMonth.day, 23, 59, 59);
  }
}

TransactionType? getTransactionType(AccountFilter filter) {
  switch (filter.flow) {
    case TransactionFlow.incoming:
      return TransactionType.income;
    case TransactionFlow.outgoing:
      return TransactionType.expense;
    case TransactionFlow.all:
      return null;
  }
}
