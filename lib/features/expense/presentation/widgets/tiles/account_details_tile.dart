import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track/features/expense/domain/entities/account_entity.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';
import 'package:track/features/expense/presentation/bloc/dashboard/expense_dashboard_bloc.dart';

class AccountDetailsTile extends StatelessWidget {
  final AccountEntity account;
  final List<TransactionEntity> transactions;
  final double accountBalance;
  final VoidCallback? onChangeAccount;
  
  const AccountDetailsTile({
    super.key, 
    required this.account,
    required this.transactions,
    required this.accountBalance,
    this.onChangeAccount,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    // Calculate account balance and income/expense
    final balance = accountBalance;
    final income = _calculateIncome();
    final expense = _calculateExpense();

    // Helper: transaction row with icon, title+time, and amount chip
    Widget txnRow({
      required IconData icon,
      required String title,
      required String time,
      required String amount,
      bool isNegative = true,
    }) {
      final chipBg =
          (isNegative ? cs.error : cs.primary).withValues(alpha: 0.08);
      final chipFg = isNegative ? cs.error : cs.primary;

      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: cs.primary.withValues(alpha: 0.10),
            child: Icon(icon, size: 18, color: cs.primary),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      text.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  time,
                  style: text.bodySmall?.copyWith(
                    color: cs.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: chipBg,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              amount,
              style: text.labelLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: chipFg,
                fontFeatures: const [FontFeature.tabularFigures()],
                letterSpacing: -0.2,
              ),
            ),
          ),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: account badge + balance + trend
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Account badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                        color: cs.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: cs.outlineVariant.withValues(alpha: 0.6)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(_getAccountIcon(account.type),
                              size: 14,
                              color: cs.onSurface.withValues(alpha: 0.7)),
                          const SizedBox(width: 6),
                          Text(
                            account.name,
                            style: text.labelMedium?.copyWith(
                              color: cs.onSurface.withValues(alpha: 0.8),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Big balance
                    Text(
                      '${account.currency}${balance.toStringAsFixed(2)}',
                      style: text.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                        fontFeatures: const [FontFeature.tabularFigures()],
                        letterSpacing: -0.4,
                      ),
                    ),
                  ],
                ),
              ),
              // Change account button
              ElevatedButton.icon(
                onPressed: () {
                  // Dispatch event to change account
                  context.read<ExpenseDashboardBloc>().add(
                    ExpenseDashboardEvent.clickedchangeAccountForSummary(
                      currentAccountID: account.accountId ?? 1,
                    ),
                  );
                  // Call custom onChangeAccount if provided
                  onChangeAccount?.call();
                },
                icon: Icon(
                  Icons.swap_horiz_rounded,
                  size: 16,
                  color: cs.primary,
                ),
                label: Text(
                  'Change',
                  style: text.labelLarge?.copyWith(
                    color: cs.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  backgroundColor: cs.primary.withValues(alpha: 0.15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                  foregroundColor: cs.primary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Income / Expense pills
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: cs.primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.south_west_rounded, size: 16, color: cs.primary),
                    const SizedBox(width: 6),
                    Text(
                      '+${account.currency}${income.toStringAsFixed(2)}',
                      style: text.labelLarge?.copyWith(
                        color: cs.primary,
                        fontWeight: FontWeight.w700,
                        fontFeatures: const [FontFeature.tabularFigures()],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: cs.error.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.north_east_rounded, size: 16, color: cs.error),
                    const SizedBox(width: 6),
                    Text(
                      '-${account.currency}${expense.toStringAsFixed(2)}',
                      style: text.labelLarge?.copyWith(
                        color: cs.error,
                        fontWeight: FontWeight.w700,
                        fontFeatures: const [FontFeature.tabularFigures()],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Section title
          Row(
            children: [
              Expanded(
                child: Text(
                  'Recent Transactions',
                  style:
                      text.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              Text(
                'View all',
                style: text.labelLarge
                    ?.copyWith(color: cs.primary, fontWeight: FontWeight.w600),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Recent transactions list
          if (transactions.isEmpty)
            _buildEmptyTransactions(context)
          else
            ...transactions.take(3).map((transaction) {
              final isNegative = transaction.type == TransactionType.expense;
              final amount = isNegative 
                  ? '-${account.currency}${transaction.amount.toStringAsFixed(2)}'
                  : '+${account.currency}${transaction.amount.toStringAsFixed(2)}'
                  ;
              
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: txnRow(
                  icon: _getTransactionIcon(transaction),
                  title: transaction.note ?? 'Transaction',
                  time: _formatTransactionDate(transaction.occurredOn),
                  amount: amount,
                  isNegative: isNegative,
                ),
              );
            }),
        ],
      ),
    );
  }

  Widget _buildEmptyTransactions(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Icon(
              Icons.receipt_long_outlined,
              size: 32,
              color: cs.onSurface.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 8),
            Text(
              'No transactions yet',
              style: text.bodySmall?.copyWith(
                color: cs.onSurface.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }


  double _calculateIncome() {
    return transactions
        .where((t) => t.type == TransactionType.income)
        .fold(0.0, (sum, t) => sum + t.amount);
  }

  double _calculateExpense() {
    return transactions
        .where((t) => t.type == TransactionType.expense)
        .fold(0.0, (sum, t) => sum + t.amount);
  }

  IconData _getAccountIcon(AccountType type) {
    switch (type) {
      case AccountType.cash:
        return Icons.attach_money_rounded;
      case AccountType.bank:
        return Icons.account_balance_rounded;
      case AccountType.card:
        return Icons.credit_card_rounded;
      case AccountType.ewallet:
        return Icons.account_balance_wallet_rounded;
      case AccountType.other:
        return Icons.account_balance_wallet_outlined;
    }
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
