
import 'package:dartz/dartz.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/features/expense/domain/entities/account_entity.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';

abstract class AccountsRepository {
  Future<Either<Failure, List<AccountEntity>>> getAccounts({required String uid});
  Future<Either<Failure, void>> addAccount({required AccountEntity account});
  Future<Either<Failure, void>> updateAccount({required AccountEntity account});
  Future<Either<Failure, void>> deleteAccount({required int accountId, required String uid});
  Future<Either<Failure, void>> setDefaultAccount({required int accountId, required String uid});
  Future<Either<Failure, bool>> isAccountInUse({required int accountId, required String uid});
  
  // Account Details methods
  Future<Either<Failure, AccountDetailsSummary>> getAccountDetailsSummary({
    required String uid,
    required int accountId,
  });
  
  Future<Either<Failure, List<TransactionEntity>>> getAccountTransactions({
    required String uid,
    required int accountId,
    DateTime? fromDate,
    DateTime? toDate,
    TransactionType? transactionType,
  });
  
  Future<Either<Failure, AccountBalanceInfo>> getAccountBalanceInfo({
    required String uid,
    required int accountId,
  });

  // Current balance regardless of filter
  Future<Either<Failure, double>> getAccountBalance({
    required String uid,
    required int accountId,
  });
}

// Data models for account details
class AccountDetailsSummary {
  final AccountEntity account;
  final List<TransactionEntity> transactions;
  final double balance;
  final AccountBalanceInfo balanceInfo;

  AccountDetailsSummary({
    required this.account,
    required this.transactions,
    required this.balance,
    required this.balanceInfo,
  });
}

class AccountBalanceInfo {
  final double currentBalance;
  final double totalIncoming;
  final double totalOutgoing;
  final double netAmount;
  final int totalTransactions;
  final int incomingCount;
  final int outgoingCount;

  AccountBalanceInfo({
    required this.currentBalance,
    required this.totalIncoming,
    required this.totalOutgoing,
    required this.netAmount,
    required this.totalTransactions,
    required this.incomingCount,
    required this.outgoingCount,
  });
}


