import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/services/logging_service.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/features/expense/domain/entities/account_entity.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';
import 'package:track/features/expense/domain/use_cases/get_account_details.dart';
import 'package:track/core/auth/firebase_services.dart';
import 'package:track/features/expense/domain/entities/helper_classes/account_details_helpers.dart';
part 'account_details_event.dart';
part 'account_details_state.dart';
part 'account_details_bloc.freezed.dart';


@injectable
class AccountDetailsBloc extends Bloc<AccountDetailsEvent, AccountDetailsState> {
  final GetAccountDetailsSummary _getAccountDetailsSummary;
  final GetAccountTransactions _getAccountTransactions;
  final GetCurrentAccountBalance _getCurrentAccountBalance;
  final FirebaseAuthService _auth;
  
  AccountDetailsBloc(
    this._getAccountDetailsSummary,
    this._getAccountTransactions,
    this._getCurrentAccountBalance,
    this._auth,
  ) : super(const AccountDetailsState.initial()) {
    logger.info('AccountDetailsBloc initialized', tag: 'AccountDetailsBloc');
    on<AccountDetailsEvent>((event, emit) async {
      await event.when(
        started: (accountId) async => _onStarted(accountId, emit),
        filterChanged: (filter) async => _onFilterChanged(filter, emit),
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
      
      await summaryResult.fold(
        (failure) async {
          emit(AccountDetailsState.failure(failure.message));
          logger.logFailure(
            failure,
            operation: 'loadAccountDetails',
            userId: 'dummy_user',
            context: {'accountId': accountId},
          );
        },
        (summary) async {
          final filter = const AccountFilter();

          // Use unfiltered transactions for initial load
          final totals = AccountTotals(incoming: summary.balanceInfo.totalIncoming, outgoing: summary.balanceInfo.totalOutgoing, net: summary.balanceInfo.netAmount, balance: summary.balanceInfo.currentBalance);
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
      
      await transactionsResult.fold(
        (failure) async {
          emit(AccountDetailsState.failure(failure.message));
          logger.logFailure(
            failure,
            operation: 'filterAccountDetails',
            userId: currentState.account.uid,
            context: {'accountId': currentState.account.accountId},
          );
        },
        (filteredTransactions) async {
          // Fetch current balance independent of filter
          final balanceEither = await _getCurrentAccountBalance.call(uid: currentState.account.uid, accountId: currentState.account.accountId!);
          final currentBalance = balanceEither.fold((_) => 0.0, (b) => b);

          final totals = _calculateTotals(filteredTransactions, currentBalance: currentBalance);
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





  AccountTotals _calculateTotals(List<TransactionEntity> transactions, {required double currentBalance}) {
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
    final totalFlow = totals.incoming - totals.outgoing; // total magnitude // minus because outgoing is negative
    if (totalFlow == 0) {
      return const DonutChartData(
        incomingPercentage: 0,
        outgoingPercentage: 0,
        incomingAmount: 0,
        outgoingAmount: 0,
      );
    }

    final incomePct = (totals.incoming / totalFlow) * 100;
    final outgoingPct = ((totals.outgoing * -1) / totalFlow) * 100; // multiply by -1 because outgoing is negative

    return DonutChartData(
      incomingPercentage: incomePct,
      outgoingPercentage: outgoingPct,
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

