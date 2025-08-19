import 'package:dartz/dartz.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';
import 'package:track/features/expense/domain/repo/accounts_repository.dart';

/// Result model for recent transactions summary
class RecentTransactionsSummary {
  final int totalCount;
  final List<TransactionEntity> transactions;

  RecentTransactionsSummary({
    required this.totalCount,
    required this.transactions,
  });
}



abstract class DashboardRepository {
  Future<Either<Failure, RecentTransactionsSummary>> getRecentTransactionsSummary({
    required String uid,
    required DateTime from,
    required DateTime to,
  });

  Future<Either<Failure, AccountDetailsSummary>> getAccountDetailsSummary({
    required String uid,
    int? accountId,

  });

  // All accounts balances
  Future<Either<Failure, List<AccountBalanceItem>>> getAllAccountBalances({
    required String uid,
  });

  // Today transactions summary (count + up to 4 items)
  Future<Either<Failure, TodayTransactionsSummary>> getTodayTransactionsSummary({
    required String uid,
  });
}

class AccountBalanceItem {
  final int accountId;
  final String name;
  final String currency;
  final double balance;

  AccountBalanceItem({
    required this.accountId,
    required this.name,
    required this.currency,
    required this.balance,
  });
}

class TodayTransactionsSummary {
  final int count;
  final List<TransactionEntity> transactions;

  TodayTransactionsSummary({
    required this.count,
    required this.transactions,
  });
}


