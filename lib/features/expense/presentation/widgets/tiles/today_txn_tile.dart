import 'package:flutter/material.dart';
import 'package:track/features/expense/domain/entities/raw_entities/transaction_entity.dart';
import 'package:track/features/expense/presentation/widgets/skeletons/badge_skeleton.dart';
import 'package:track/features/expense/presentation/widgets/skeletons/chip_skeleton.dart';
import 'package:track/features/expense/presentation/widgets/skeletons/trx_row_skeleton.dart';

class TodayTxnTile extends StatelessWidget {
  final int todayCount;
  final List<TransactionEntity> transactions;
  const TodayTxnTile({super.key, this.todayCount = 0, this.transactions = const []});

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
              TitleBadgeSkeleton(label: 'Today Transactions'),
              // Count chip
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: cs.primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.calendar_month_rounded, size: 16, color: cs.primary),
                    const SizedBox(width: 6),
                    Text('$todayCount Today',
                        style: text.labelLarge?.copyWith(color: cs.primary, fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          if (transactions.isEmpty)
            Center(
              child: Text(
                'No transactions today',
                style: text.bodySmall?.copyWith(
                  color: cs.onSurface.withValues(alpha: 0.6),
                ),
              ),
            )
          else ...[
            for (int i = 0; i < transactions.length; i++) ...[
              TrxRowSkeleton(
                icon: _getTransactionIcon(transactions[i]),
                accent: _getAccentColor(cs, transactions[i]),
                title: transactions[i].note ?? 'Transaction',
                sub: _formatTransactionDate(transactions[i].occurredOn),
                trailing: AmountChipSkeleton(
                  amount: _formatAmount(transactions[i]),
                  negative: transactions[i].type == TransactionType.expense,
                ),
              ),
              if (i != transactions.length - 1) const SizedBox(height: 8),
            ]
          ],
        ],
      ),
    );
  }

  IconData _getTransactionIcon(TransactionEntity transaction) {
    switch (transaction.type) {
      case TransactionType.income:
        return Icons.attach_money_rounded;
      case TransactionType.expense:
        return Icons.shopping_cart_rounded;
      case TransactionType.transfer:
        return Icons.swap_horiz_rounded;
    }
  }

  Color _getAccentColor(ColorScheme cs, TransactionEntity transaction) {
    switch (transaction.type) {
      case TransactionType.income:
        return Colors.green;
      case TransactionType.expense:
        return cs.primary;
      case TransactionType.transfer:
        return cs.tertiary;
    }
  }

  String _formatAmount(TransactionEntity t) {
    final prefix = t.type == TransactionType.expense ? '-' : '+';
    return '$prefix${t.currency}${t.amount.toStringAsFixed(2)}';
  }

  String _formatTransactionDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final transactionDate = DateTime(date.year, date.month, date.day);

    if (transactionDate == today) {
      return 'Today • ${_formatTime(date)}';
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
