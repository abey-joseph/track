import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track/features/expense/domain/entities/account_entity.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';
import 'package:track/features/expense/presentation/bloc/account_details/account_details_bloc.dart';
import 'package:track/features/expense/presentation/widgets/donut_chart.dart';
import 'package:track/features/expense/domain/entities/helper_classes/account_details_helpers.dart';
import 'package:track/features/expense/presentation/widgets/filter_dialog.dart';
import 'package:track/features/common/presentation/widgets/info_chip.dart';
import 'package:track/features/common/presentation/widgets/themed_card_tile.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'dart:developer';

class AccountDetailsPage extends StatelessWidget {
  final int accountId;
  final String accountName;

  const AccountDetailsPage({
    super.key,
    required this.accountId,
    required this.accountName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountDetailsBloc>(
      create: (context) => getIt<AccountDetailsBloc>()..add(AccountDetailsEvent.started(accountId: accountId)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(accountName),
          actions: [
            Builder(
              builder: (innerCtx) => IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: () => _showFilterDialog(
                  innerCtx,
                  innerCtx.read<AccountDetailsBloc>(),
                ),
                tooltip: 'Filter',
              ),
            ),
          ],
        ),
        body: BlocBuilder<AccountDetailsBloc, AccountDetailsState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              failure: (message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
                    const SizedBox(height: 16),
                    Text('Error: $message', style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => context.read<AccountDetailsBloc>().add(
                        AccountDetailsEvent.started(accountId: accountId),
                      ),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
              loaded: (account, filter, totals, counts, donutData, groupedTransactions, allTransactions) {
               
                return _AccountDetailsContent(
                  account: account,
                  totals: totals,
                  counts: counts,
                  donutData: donutData,
                  groupedTransactions: groupedTransactions,
                  onFilterChanged: (newFilter) {
                    context.read<AccountDetailsBloc>().add(
                      AccountDetailsEvent.filterChanged(filter: newFilter),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _showFilterDialog(BuildContext context1, AccountDetailsBloc bloc) async {
    final filter = await showDialog<AccountFilter>(
      context: context1,
      builder: (_) => const FilterDialog(),
    );

    if (filter != null) {
      bloc.add(AccountDetailsEvent.filterChanged(filter: filter));
    }
  }
}

class _AccountDetailsContent extends StatelessWidget {
  final AccountEntity account;
  final AccountTotals totals;
  final AccountCounts counts;
  final DonutChartData donutData;
  final Map<DateTime, List<TransactionEntity>> groupedTransactions;
  final Function(AccountFilter) onFilterChanged;

  const _AccountDetailsContent({
    required this.account,
    required this.totals,
    required this.counts,
    required this.donutData,
    required this.groupedTransactions,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Header Card with Balance
        Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'Current Balance',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${totals.balance.toStringAsFixed(2)}',
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _BalanceItem(
                      label: 'Incoming',
                      amount: totals.incoming,
                      color: Colors.green,
                    ),
                    _BalanceItem(
                      label: 'Outgoing',
                      amount: totals.outgoing,
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Donut Chart
        Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'Income vs Expenses',
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 200,
                  child: DonutChart(data: donutData),
                ),
                const SizedBox(height: 16),
                LayoutBuilder(
                  builder: (context, constraints) {
                    log('constraints: ${constraints.maxWidth}');
                    final isCompact = constraints.maxWidth < 300;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _LegendItem(
                          label: isCompact ? 'Incomming' : '',
                          color: Colors.green,
                          percentage: donutData.incomingPercentage,
                        ),
                        _LegendItem(
                          label: isCompact ? 'Outgoing' : '',
                          color: Colors.red,
                          percentage: donutData.outgoingPercentage,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Info Chips
        Row(
          children: [
            Expanded(
              child: InfoChip(
                label: 'Total: ${counts.total}',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: InfoChip(
                label: 'In: ${counts.incoming}',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: InfoChip(
                label: 'Out: ${counts.outgoing}',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: InfoChip(
                label: 'Net: \$${totals.net.toStringAsFixed(0)}',
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 24),
        
        // Transactions List
        if (groupedTransactions.isEmpty)
          _EmptyTransactionsPlaceholder()
        else
          _TransactionsList(groupedTransactions: groupedTransactions),
      ],
    );
  }
}

class _BalanceItem extends StatelessWidget {
  final String label;
  final double amount;
  final Color color;

  const _BalanceItem({
    required this.label,
    required this.amount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 4),
        Text(
          '\$${amount.toStringAsFixed(2)}',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final String label;
  final Color color;
  final double percentage;

  const _LegendItem({
    required this.label,
    required this.color,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '$label (${percentage.toStringAsFixed(1)}%)',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class _EmptyTransactionsPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.receipt_long_outlined,
            size: 64,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 16),
          Text(
            'No transactions found',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try adjusting your filters',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}

class _TransactionsList extends StatelessWidget {
  final Map<DateTime, List<TransactionEntity>> groupedTransactions;

  const _TransactionsList({required this.groupedTransactions});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Transactions',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        ...groupedTransactions.entries.map((entry) {
          final date = entry.key;
          final transactions = entry.value;
          
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sticky Header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _formatDate(date),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              
              // Transactions for this day
              ...transactions.map((transaction) => _TransactionTile(transaction: transaction)),
              
              const SizedBox(height: 16),
            ],
          );
        }),
      ],
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final transactionDate = DateTime(date.year, date.month, date.day);
    
    if (transactionDate == today) {
      return 'Today';
    } else if (transactionDate == yesterday) {
      return 'Yesterday';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}

class _TransactionTile extends StatelessWidget {
  final TransactionEntity transaction;

  const _TransactionTile({required this.transaction});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isIncome = transaction.type == TransactionType.income;
    final amountColor = isIncome ? Colors.green : Colors.red;
    final amountPrefix = isIncome ? '+' : '-';
    
    return ThemedCardTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: theme.colorScheme.primaryContainer,
        child: Icon(
          _getCategoryIcon(transaction.note ?? ''),
          color: theme.colorScheme.onPrimaryContainer,
          size: 20,
        ),
      ),
      title: Text(
        transaction.note ?? 'No description',
        style: theme.textTheme.titleMedium,
        overflow: TextOverflow.ellipsis,
      ),
              subtitle: Text(
          _formatTime(transaction.occurredAt ?? transaction.occurredOn),
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      trailingActions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '$amountPrefix\$${transaction.amount.toStringAsFixed(2)}',
              style: theme.textTheme.titleMedium?.copyWith(
                color: amountColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: _getTransactionTypeColor(transaction.type).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                transaction.type.name.toUpperCase(),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: _getTransactionTypeColor(transaction.type),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  IconData _getCategoryIcon(String note) {
    if (note.toLowerCase().contains('salary') || note.toLowerCase().contains('income')) {
      return Icons.work;
    } else if (note.toLowerCase().contains('groceries')) {
      return Icons.shopping_cart;
    } else if (note.toLowerCase().contains('transport')) {
      return Icons.directions_car;
    } else if (note.toLowerCase().contains('entertainment')) {
      return Icons.movie;
    } else if (note.toLowerCase().contains('bills')) {
      return Icons.receipt;
    } else {
      return Icons.category;
    }
  }

  Color _getTransactionTypeColor(TransactionType type) {
    switch (type) {
      case TransactionType.income:
        return Colors.green;
      case TransactionType.expense:
        return Colors.red;
      case TransactionType.transfer:
        return Colors.blue;
    }
  }

  String _formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}
