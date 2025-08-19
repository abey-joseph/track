import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/services/logging_service.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/features/expense/domain/entities/account_entity.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';
import 'package:track/features/expense/domain/use_cases/get_account_details.dart';
import 'package:track/core/auth/firebase_services.dart';

part 'account_details_event.dart';
part 'account_details_state.dart';
part 'account_details_bloc.freezed.dart';

// TODO: something wrong with the filter, it's not working as expected

@injectable
class AccountDetailsBloc extends Bloc<AccountDetailsEvent, AccountDetailsState> {
  final GetAccountDetailsSummary _getAccountDetailsSummary;
  final GetAccountTransactions _getAccountTransactions;
  final FirebaseAuthService _auth;
  
  AccountDetailsBloc(
    this._getAccountDetailsSummary,
    this._getAccountTransactions,
    this._auth,
  ) : super(const AccountDetailsState.initial()) {
    logger.info('AccountDetailsBloc initialized', tag: 'AccountDetailsBloc');
    on<AccountDetailsEvent>((event, emit) async {
      await event.when(
        started: (accountId) => _onStarted(accountId, emit),
        filterChanged: (filter) => _onFilterChanged(filter, emit),
      );
    });
  }

  Future<void> _onStarted(int accountId, Emitter<AccountDetailsState> emit) async {
    emit(const AccountDetailsState.loading());
    
    logger.info('Loading account details for account: $accountId', tag: 'AccountDetailsBloc');
    
    try {
      // Get account details from repository
      final uid = _auth.currentUser?.uid ?? '';
      final summaryResult = await _getAccountDetailsSummary.call(
        uid: uid,
        accountId: accountId,
      );
      
      summaryResult.fold(
        (failure) {
          emit(AccountDetailsState.failure(failure.message));
          logger.logFailure(
            failure,
            operation: 'loadAccountDetails',
            userId: 'dummy_user',
            context: {'accountId': accountId},
          );
        },
        (summary) {
          final filter = const AccountFilter();
          final totals = _calculateTotals(summary.transactions);
          final groupedTransactions = _groupTransactionsByDay(summary.transactions);
          final donutData = _generateDonutData(totals);
          
          emit(AccountDetailsState.loaded(
            account: summary.account,
            filter: filter,
            totals: totals,
            counts: _calculateCounts(summary.transactions),
            donutData: donutData,
            groupedTransactions: groupedTransactions,
            allTransactions: summary.transactions,
          ));
          
          logger.logSuccess(
            'Load account details',
            userId: summary.account.uid,
            context: {'accountId': accountId, 'transactionCount': summary.transactions.length},
          );
        },
      );
    } catch (e) {
      emit(AccountDetailsState.failure(e.toString()));
      logger.logFailure(
        UnknownFailure(e.toString()),
        operation: 'loadAccountDetails',
        userId: 'dummy_user',
        context: {'accountId': accountId},
      );
    }
  }

  Future<void> _onFilterChanged(AccountFilter filter, Emitter<AccountDetailsState> emit) async {
    final currentState = state;
    
    if (currentState is! _AccountDetailsLoaded) return;

    emit(const AccountDetailsState.loading());

    try {
      // Get filtered transactions from repository
      final transactionsResult = await _getAccountTransactions.call(
        uid: currentState.account.uid,
        accountId: currentState.account.accountId!,
        fromDate: _getFromDate(filter),
        toDate: _getToDate(filter),
        transactionType: _getTransactionType(filter),
      );
      
      transactionsResult.fold(
        (failure) {
          emit(AccountDetailsState.failure(failure.message));
          logger.logFailure(
            failure,
            operation: 'filterAccountDetails',
            userId: currentState.account.uid,
            context: {'accountId': currentState.account.accountId},
          );
        },
        (filteredTransactions) {
          final totals = _calculateTotals(filteredTransactions);
          final groupedTransactions = _groupTransactionsByDay(filteredTransactions);
          final donutData = _generateDonutData(totals);
          
          emit(currentState.copyWith(
            filter: filter,
            totals: totals,
            counts: _calculateCounts(filteredTransactions),
            donutData: donutData,
            groupedTransactions: groupedTransactions,
          ));
          
          logger.info('Filter changed: ${filter.toString()}', tag: 'AccountDetailsBloc');
        },
      );
    } catch (e) {
      emit(AccountDetailsState.failure(e.toString()));
      logger.logFailure(
        UnknownFailure(e.toString()),
        operation: 'filterAccountDetails',
        userId: currentState.account.uid,
        context: {'accountId': currentState.account.accountId},
      );
    }
  }





  AccountTotals _calculateTotals(List<TransactionEntity> transactions) {
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
      balance: 5000 + incoming - outgoing, // Starting balance + net
    );
  }

  AccountCounts _calculateCounts(List<TransactionEntity> transactions) {
    int total = transactions.length;
    int incoming = transactions.where((t) => t.type == TransactionType.income).length;
    int outgoing = transactions.where((t) => t.type == TransactionType.expense).length;
    
    return AccountCounts(
      total: total,
      incoming: incoming,
      outgoing: outgoing,
    );
  }

  DonutChartData _generateDonutData(AccountTotals totals) {
    final total = totals.incoming + totals.outgoing;
    if (total == 0) {
      return const DonutChartData(
        incomingPercentage: 0,
        outgoingPercentage: 0,
        incomingAmount: 0,
        outgoingAmount: 0,
      );
    }
    
    return DonutChartData(
      incomingPercentage: (totals.incoming / total) * 100,
      outgoingPercentage: (totals.outgoing / total) * 100,
      incomingAmount: totals.incoming,
      outgoingAmount: totals.outgoing,
    );
  }

  Map<DateTime, List<TransactionEntity>> _groupTransactionsByDay(List<TransactionEntity> transactions) {
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
  DateTime? _getFromDate(AccountFilter filter) {
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

  DateTime? _getToDate(AccountFilter filter) {
    switch (filter.dateRange) {
      case DateRange.today:
        final today = DateTime.now();
        return DateTime(today.year, today.month, today.day, 23, 59, 59);
      case DateRange.thisWeek:
        final now = DateTime.now();
        final endOfWeek = now.add(Duration(days: 7 - now.weekday));
        return DateTime(endOfWeek.year, endOfWeek.month, endOfWeek.day, 23, 59, 59);
      case DateRange.custom:
        return filter.customEndDate;
      case DateRange.all:
        return null;
      case DateRange.thisMonth:
        final now = DateTime.now();
        final endOfMonth = DateTime(now.year, now.month + 1, 0);
        return DateTime(endOfMonth.year, endOfMonth.month, endOfMonth.day, 23, 59, 59);
    }
  }

  TransactionType? _getTransactionType(AccountFilter filter) {
    switch (filter.flow) {
      case TransactionFlow.incoming:
        return TransactionType.income;
      case TransactionFlow.outgoing:
        return TransactionType.expense;
      case TransactionFlow.all:
        return null;
    }
  }
}

// Helper classes
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
