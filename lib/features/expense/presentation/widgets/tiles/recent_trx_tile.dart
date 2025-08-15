import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track/features/expense/presentation/bloc/dashboard/expense_dashboard_bloc.dart';
import 'package:track/features/expense/presentation/widgets/skeletons/badge_skeleton.dart';
import 'package:track/features/expense/presentation/widgets/skeletons/chip_skeleton.dart';
import 'package:track/features/expense/presentation/widgets/skeletons/trx_row_skeleton.dart';
import 'package:track/features/expense/presentation/widgets/helpers/transaction_icon_helper.dart';
import 'package:track/features/auth/presentation/bloc/firebase_auth_bloc.dart';

class RecentTransactionTile extends StatelessWidget {
  const RecentTransactionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseDashboardBloc, ExpenseDashboardState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context, state),
              const SizedBox(height: 30),
              _buildTransactionsList(context, state),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, ExpenseDashboardState state) {
    final text = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TitleBadgeSkeleton(label: 'Recent Transactions'),
        
        // Clickable Transaction count indicator chip
        GestureDetector(
          onTap: () => _onChipTapped(context, state),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: cs.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: cs.primary.withValues(alpha: 0.2), width: 1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.calendar_month_rounded, size: 16, color: cs.primary),
                const SizedBox(width: 6),
                Text(
                  state.when(
                    initial: () => '0 in 30D',
                    loading: () => '... in 30D',
                    loaded: (data, dayCount, _) => 
                      '${data.transactionCountInPeriod} in ${dayCount}D',
                    dayCountChanged: (data, dayCount, _) => 
                      '${data.transactionCountInPeriod} in ${dayCount}D',
                    accountChanged: (data, dayCount, _) => 
                      '${data.transactionCountInPeriod} in ${dayCount}D',
                    error: (_) => '0 in 30D',
                  ),
                  style: text.labelLarge?.copyWith(
                    color: cs.primary, 
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _onChipTapped(BuildContext context, ExpenseDashboardState state) {
    int currentDayCount = 30;
    
    // Extract current day count from state
    state.when(
      initial: () => currentDayCount = 30,
      loading: () => currentDayCount = 30,
      loaded: (data, dayCount, _) => currentDayCount = dayCount,
      dayCountChanged: (data, dayCount, _) => currentDayCount = dayCount,
      accountChanged: (data, dayCount, _) => currentDayCount = dayCount,
      error: (_) => currentDayCount = 30,
    );
    
    // Cycle through day counts: 30 -> 10 -> 20 -> 30
    int newDayCount;
    switch (currentDayCount) {
      case 30:
        newDayCount = 10;
        break;
      case 10:
        newDayCount = 20;
        break;
      case 20:
        newDayCount = 30;
        break;
      default:
        newDayCount = 30;
    }
    
    // Trigger day count change event
    context.read<ExpenseDashboardBloc>().add(
      ExpenseDashboardEvent.clickedDayCountForRecentTxn(
        currentDayCount: newDayCount,
      ),
    );
  }

  Widget _buildTransactionsList(BuildContext context, ExpenseDashboardState state) {
    return state.when(
      initial: () => _buildInitialState(context),
      loading: () => _buildLoadingState(context),
      loaded: (data, _, __) => _buildLoadedState(context, data.recentTransactions),
      dayCountChanged: (data, _, __) => _buildLoadedState(context, data.recentTransactions),
      accountChanged: (data, _, __) => _buildLoadedState(context, data.recentTransactions),
      error: (message) => _buildErrorState(context, message),
    );
  }

  Widget _buildInitialState(BuildContext context) {
    // Trigger data fetch when widget is first built
    final authState = context.read<FirebaseAuthBloc>().state;
    authState.whenOrNull(
      authenticated: (uid, email, displayName) {
        context.read<ExpenseDashboardBloc>().add(
          ExpenseDashboardEvent.fetchAllSummary(uid: uid),
        );
      },
    );
    
    return _buildLoadingState(context);
  }

  Widget _buildLoadingState(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    
    return Column(
      children: [
        TrxRowSkeleton(
          icon: Icons.circle,
          accent: cs.primary.withValues(alpha: 0.3),
          title: 'Loading...',
          sub: 'Please wait',
          trailing: const AmountChipSkeleton(amount: '...', negative: false),
        ),
        const SizedBox(height: 8),
        TrxRowSkeleton(
          icon: Icons.circle,
          accent: cs.primary.withValues(alpha: 0.3),
          title: 'Loading...',
          sub: 'Please wait',
          trailing: const AmountChipSkeleton(amount: '...', negative: false),
        ),
      ],
    );
  }

  Widget _buildLoadedState(BuildContext context, List transactions) {
    if (transactions.isEmpty) {
      return _buildEmptyState(context);
    }

    return Column(
      children: transactions.take(4).map<Widget>((transaction) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TrxRowSkeleton(
            icon: TransactionIconHelper.getIconForTransaction(transaction, null),
            accent: TransactionIconHelper.getColorForTransaction(transaction, context),
            title: _getTransactionTitle(transaction),
            sub: TransactionIconHelper.formatDateTime(transaction.occurredOn),
            trailing: AmountChipSkeleton(
              amount: TransactionIconHelper.formatAmount(transaction.amount),
              negative: transaction.amount < 0,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Icon(
              Icons.receipt_long,
              size: 48,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No transactions yet',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Start tracking your expenses',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: Colors.red[400],
            ),
            const SizedBox(height: 16),
            Text(
              'Error loading transactions',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.red[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.red[500],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  String _getTransactionTitle(dynamic transaction) {
    // Try to get payee name, category name, or use a default
    if (transaction.note != null && transaction.note!.isNotEmpty) {
      return transaction.note!;
    }
    
    switch (transaction.type.toString().toLowerCase()) {
      case 'expense':
        return 'Expense';
      case 'income':
        return 'Income';
      case 'transfer':
        return 'Transfer';
      default:
        return 'Transaction';
    }
  }
}
