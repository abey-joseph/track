import 'package:dartz/dartz.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/features/expense/domain/entities/account_entity.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';

/// Result model for recent transactions summary
class RecentTransactionsSummary {
  final int totalCount;
  final List<TransactionEntity> transactions;

  RecentTransactionsSummary({
    required this.totalCount,
    required this.transactions,
  });
}

/// Result model for account details summary
class AccountDetailsSummary {
  final AccountEntity account;
  final List<TransactionEntity> transactions;
  final double balance;

  AccountDetailsSummary({
    required this.account,
    required this.transactions,
    required this.balance,
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
}


