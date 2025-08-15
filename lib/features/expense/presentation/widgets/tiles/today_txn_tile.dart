import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track/features/expense/presentation/bloc/dashboard/expense_dashboard_bloc.dart';
import 'package:track/features/expense/presentation/widgets/skeletons/badge_skeleton.dart';
import 'package:track/features/expense/presentation/widgets/skeletons/chip_skeleton.dart';
import 'package:track/features/expense/presentation/widgets/skeletons/trx_row_skeleton.dart';
import 'package:track/features/expense/presentation/widgets/helpers/transaction_icon_helper.dart';

class TodayTxnTile extends StatelessWidget {
  const TodayTxnTile({super.key});

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
              _buildTodayTransactionsList(context, state),
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
        const TitleBadgeSkeleton(label: 'Today Transactions'),
        
        // Today transaction count indicator
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: cs.secondary.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.today_rounded, size: 16, color: cs.secondary),
              const SizedBox(width: 6),
              Text(
                state.when(
                  initial: () => '0 Today',
                  loading: () => '... Today',
                  loaded: (data, _, __) => '${data.todayTransactions.length} Today',
                  dayCountChanged: (data, _, __) => '${data.todayTransactions.length} Today',
                  accountChanged: (data, _, __) => '${data.todayTransactions.length} Today',
                  error: (_) => '0 Today',
                ),
                style: text.labelLarge?.copyWith(
                  color: cs.secondary, 
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTodayTransactionsList(BuildContext context, ExpenseDashboardState state) {
    return state.when(
      initial: () => _buildLoadingState(context),
      loading: () => _buildLoadingState(context),
      loaded: (data, _, __) => _buildLoadedState(context, data.todayTransactions),
      dayCountChanged: (data, _, __) => _buildLoadedState(context, data.todayTransactions),
      accountChanged: (data, _, __) => _buildLoadedState(context, data.todayTransactions),
      error: (message) => _buildErrorState(context, message),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    
    return Column(
      children: [
        TrxRowSkeleton(
          icon: Icons.circle,
          accent: cs.secondary.withValues(alpha: 0.3),
          title: 'Loading...',
          sub: 'Please wait',
          trailing: const AmountChipSkeleton(amount: '...', negative: false),
        ),
        const SizedBox(height: 8),
        TrxRowSkeleton(
          icon: Icons.circle,
          accent: cs.secondary.withValues(alpha: 0.3),
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
              Icons.today_outlined,
              size: 48,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No transactions today',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Start your day with tracking',
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
              'Error loading today\'s transactions',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.red[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getTransactionTitle(dynamic transaction) {
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
