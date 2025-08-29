import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track/features/expense/domain/entities/raw_entities/transaction_entity.dart';
import 'package:track/features/expense/presentation/bloc/dashboard/expense_dashboard_bloc.dart';
import 'package:track/features/expense/presentation/widgets/skeletons/badge_skeleton.dart';
import 'package:track/features/expense/presentation/widgets/skeletons/chip_skeleton.dart';
import 'package:track/features/expense/presentation/widgets/skeletons/trx_row_skeleton.dart';

class RecentTransactionTile extends StatelessWidget {
  final List<TransactionEntity> transactions;
  final int dayCount;
  final int txnCount;

  const RecentTransactionTile({
    super.key,
    required this.transactions,
    required this.dayCount,
    required this.txnCount,
  });

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleBadgeSkeleton(label: 'Recent Transactions'),
              //const SizedBox(height: 10),

              // Day count indicator chip
              GestureDetector(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: cs.primary.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.calendar_month_rounded,
                          size: 16, color: cs.primary),
                      const SizedBox(width: 6),
                      Text('$txnCount in ${dayCount}D',
                          style: text.labelLarge?.copyWith(
                              color: cs.primary, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
                onTap: () {
                  // Dispatch event to change day count
                  context.read<ExpenseDashboardBloc>().add(
                        ExpenseDashboardEvent.clickedDayCountForRecentTxn(
                          currentDayCount: dayCount,
                        ),
                      );
                },
              ),
            ],
          ),

          // Animated section for recent transactions area
          transactions.isEmpty
              ? _buildEmptyState(context)
              : Column(
                  children: [
                    ...transactions.take(4).map((transaction) {
                      final isNegative =
                          transaction.type == TransactionType.expense;
                      final amount = isNegative
                          ? '-${transaction.currency}${transaction.amount.toStringAsFixed(2)}'
                          : '+${transaction.currency}${transaction.amount.toStringAsFixed(2)}';

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: TrxRowSkeleton(
                          icon: _getTransactionIcon(transaction),
                          accent: _getTransactionColor(transaction, cs),
                          title: transaction.note ?? 'Transaction',
                          sub: _formatTransactionDate(transaction.occurredOn),
                          trailing: AmountChipSkeleton(
                              amount: amount, negative: isNegative),
                        ),
                      );
                    }),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Icon(
              Icons.receipt_long_outlined,
              size: 48,
              color: cs.onSurface.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 12),
            Text(
              'No transactions yet',
              style: text.bodyMedium?.copyWith(
                color: cs.onSurface.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getTransactionIcon(TransactionEntity transaction) {
    // You can enhance this based on category or transaction type
    switch (transaction.type) {
      case TransactionType.income:
        return Icons.attach_money_rounded;
      case TransactionType.expense:
        return Icons.shopping_cart_rounded;
      case TransactionType.transfer:
        return Icons.swap_horiz_rounded;
    }
  }

  Color _getTransactionColor(TransactionEntity transaction, ColorScheme cs) {
    switch (transaction.type) {
      case TransactionType.income:
        return Colors.green;
      case TransactionType.expense:
        return cs.primary;
      case TransactionType.transfer:
        return cs.secondary;
    }
  }

  String _formatTransactionDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final transactionDate = DateTime(date.year, date.month, date.day);

    if (transactionDate == today) {
      return 'Today • ${_formatTime(date)}';
    } else if (transactionDate == yesterday) {
      return 'Yesterday • ${_formatTime(date)}';
    } else {
      return '${_formatDate(date)} • ${_formatTime(date)}';
    }
  }

  String _formatTime(DateTime date) {
    return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
