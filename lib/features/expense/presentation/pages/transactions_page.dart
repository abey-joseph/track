import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/core/services/logging_service.dart';
import 'package:track/core/widgets/error_widgets.dart';
import 'package:track/features/auth/presentation/bloc/firebase_auth_bloc.dart';
import 'package:track/features/expense/domain/entities/raw_entities/transaction_entity.dart';
import 'package:track/features/expense/presentation/bloc/transactions/transactions_bloc.dart';
import 'package:track/core/utils/injection/get_it.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<FirebaseAuthBloc>().state;
    final uid = auth is authAuthenticated ? auth.uid : '';
    
    return ErrorBoundary(
      child: BlocProvider<TransactionsBloc>(
        create: (context) => getIt<TransactionsBloc>()..add(TransactionsEvent.load(uid: uid)),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('All Transactions'),
            actions: [
              IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: () {
                  // TODO: Implement date range filter
                  logger.logUserAction('filter_transactions_clicked', userId: uid, screen: 'transactions_page');
                },
              ),
            ],
          ),
          body: BlocConsumer<TransactionsBloc, TransactionsState>(
            listener: (context, state) {
              state.when(
                initial: () {},
                loading: () {},
                loaded: (transactions) {
                  logger.logUserAction(
                    'transactions_page_loaded',
                    userId: uid,
                    screen: 'transactions_page',
                    parameters: {'transactionCount': transactions.length},
                  );
                },
                failure: (message) {
                  FailureSnackBar.show(
                    context,
                    UnknownFailure(message),
                    onRetry: () {
                      context.read<TransactionsBloc>().add(TransactionsEvent.load(uid: uid));
                    },
                  );
                },
              );
            },
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox.shrink(),
                loading: () => const Center(child: CircularProgressIndicator()),
                failure: (message) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FailureWidget(
                      failure: UnknownFailure(message),
                      onRetry: () {
                        context.read<TransactionsBloc>().add(TransactionsEvent.load(uid: uid));
                      },
                      showDetails: true,
                    ),
                  ),
                ),
                loaded: (transactions) {
                  if (transactions.isEmpty) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.receipt_long, size: 64, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            'No transactions found',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Your transactions will appear here',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    );
                  }

                  // Group transactions by date
                  final groupedTransactions = _groupTransactionsByDate(transactions);
                  
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: groupedTransactions.length,
                    itemBuilder: (context, index) {
                      final dateGroup = groupedTransactions.entries.elementAt(index);
                      return _buildDateGroup(dateGroup, context);
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDateGroup(MapEntry<DateTime, List<TransactionEntity>> dateGroup, BuildContext context) {
    final date = dateGroup.key;
    final transactions = dateGroup.value;
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Date header
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(Icons.calendar_today, size: 16, color: theme.colorScheme.onSurfaceVariant),
              const SizedBox(width: 8),
              Text(
                _formatDate(date),
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Text(
                '${transactions.length} transaction${transactions.length == 1 ? '' : 's'}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        
        // Transactions for this date
        ...transactions.map((transaction) => _buildTransactionTile(transaction, context)),
        
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildTransactionTile(TransactionEntity transaction, BuildContext context) {
    final theme = Theme.of(context);
    final isExpense = transaction.type == TransactionType.expense;
    final isIncome = transaction.type == TransactionType.income;
    
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getTransactionColor(transaction.type, theme),
          child: Icon(
            _getTransactionIcon(transaction.type),
            color: Colors.white,
            size: 20,
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                transaction.note?.isNotEmpty == true 
                    ? transaction.note! 
                    : _getTransactionTypeText(transaction.type),
                style: theme.textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              '${isExpense ? '-' : isIncome ? '+' : ''}${transaction.currency} ${transaction.amount.toStringAsFixed(2)}',
              style: theme.textTheme.titleMedium?.copyWith(
                color: _getTransactionColor(transaction.type, theme),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.access_time, size: 14, color: theme.colorScheme.onSurfaceVariant),
                const SizedBox(width: 4),
                Text(
                  _formatTime(transaction.occurredOn),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                if (transaction.hasSplit) ...[
                  const SizedBox(width: 16),
                  Icon(Icons.call_split, size: 14, color: theme.colorScheme.onSurfaceVariant),
                  const SizedBox(width: 4),
                  Text(
                    'Split',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
        onTap: () {
          logger.logUserAction('transaction_details_opened', userId: 'user id unknown', screen: 'transactions_page', parameters: {'transactionId': transaction.transactionId});
          _showTransactionDetails(transaction, context);
        },
      ),
    );
  }

  void _showTransactionDetails(TransactionEntity transaction, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(
              _getTransactionIcon(transaction.type),
              color: _getTransactionColor(transaction.type, Theme.of(context)),
            ),
            const SizedBox(width: 8),
            const Text('Transaction Details'),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow('Type', _getTransactionTypeText(transaction.type)),
              _buildDetailRow('Amount', '${transaction.currency} ${transaction.amount.toStringAsFixed(2)}'),
              _buildDetailRow('Date', _formatDate(transaction.occurredOn)),
              _buildDetailRow('Time', _formatTime(transaction.occurredOn)),
              if (transaction.note?.isNotEmpty == true)
                _buildDetailRow('Note', transaction.note!),
              if (transaction.hasSplit)
                _buildDetailRow('Split', 'Yes'),
              if (transaction.transferGroupId != null)
                _buildDetailRow('Transfer Group', transaction.transferGroupId!),
              _buildDetailRow('Created', _formatDateTime(transaction.createdAt)),
              if (transaction.updatedAt != null)
                _buildDetailRow('Updated', _formatDateTime(transaction.updatedAt!)),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  Map<DateTime, List<TransactionEntity>> _groupTransactionsByDate(List<TransactionEntity> transactions) {
    final grouped = <DateTime, List<TransactionEntity>>{};
    
    for (final transaction in transactions) {
      final date = DateTime(transaction.occurredOn.year, transaction.occurredOn.month, transaction.occurredOn.day);
      grouped.putIfAbsent(date, () => []).add(transaction);
    }
    
    // Sort by date (newest first)
    final sortedEntries = grouped.entries.toList()
      ..sort((a, b) => b.key.compareTo(a.key));
    
    return Map.fromEntries(sortedEntries);
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final dateOnly = DateTime(date.year, date.month, date.day);
    
    if (dateOnly == today) {
      return 'Today';
    } else if (dateOnly == yesterday) {
      return 'Yesterday';
    } else {
      return '${_getDayName(date.weekday)}, ${_getMonthName(date.month)} ${date.day}, ${date.year}';
    }
  }

  String _formatTime(DateTime date) {
    final hour = date.hour;
    final minute = date.minute;
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '${displayHour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
  }

  String _formatDateTime(DateTime date) {
    return '${_getMonthName(date.month)} ${date.day}, ${date.year} ${_formatTime(date)}';
  }

  String _getDayName(int weekday) {
    const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    return days[weekday - 1];
  }

  String _getMonthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }

  Color _getTransactionColor(TransactionType type, ThemeData theme) {
    switch (type) {
      case TransactionType.expense:
        return Colors.red;
      case TransactionType.income:
        return Colors.green;
      case TransactionType.transfer:
        return Colors.blue;
    }
  }

  IconData _getTransactionIcon(TransactionType type) {
    switch (type) {
      case TransactionType.expense:
        return Icons.remove_circle;
      case TransactionType.income:
        return Icons.add_circle;
      case TransactionType.transfer:
        return Icons.swap_horiz;
    }
  }

  String _getTransactionTypeText(TransactionType type) {
    switch (type) {
      case TransactionType.expense:
        return 'Expense';
      case TransactionType.income:
        return 'Income';
      case TransactionType.transfer:
        return 'Transfer';
    }
  }
}
