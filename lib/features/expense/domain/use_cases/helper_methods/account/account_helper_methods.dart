import 'package:track/features/expense/domain/entities/raw_entities/transaction_entity.dart';
import 'package:track/features/expense/domain/entities/view_entities/account/account_details.dart';

class AccountHelperMethods {
  AccountActivityInfoBasedOnFilter summarizeTransactions(
      List<TransactionEntity> transactions,
      {double currentBalance = 0.0}) {
    double totalIncoming = 0.0;
    double totalOutgoing = 0.0;
    int incomingCount = 0;
    int outgoingCount = 0;

    for (final t in transactions) {
      if (t.type == TransactionType.income) {
        totalIncoming += t.amount;
        incomingCount++;
      } else if (t.type == TransactionType.expense) {
        totalOutgoing += t.amount;
        outgoingCount++;
      }
    }

    final net = totalIncoming - totalOutgoing;

    return AccountActivityInfoBasedOnFilter(
      currentBalance: currentBalance,
      totalIncoming: totalIncoming,
      totalOutgoing: totalOutgoing,
      netAmount: net,
      totalTransactions: transactions.length,
      incomingCount: incomingCount,
      outgoingCount: outgoingCount,
    );
  }
}
