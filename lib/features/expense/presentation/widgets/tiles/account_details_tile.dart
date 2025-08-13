import 'package:flutter/material.dart';

class AccountDetailsTile extends StatelessWidget {
  final VoidCallback? onChangeAccount;
  const AccountDetailsTile({super.key, this.onChangeAccount});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

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
                          Icon(Icons.account_balance_wallet_outlined,
                              size: 14,
                              color: cs.onSurface.withValues(alpha: 0.7)),
                          const SizedBox(width: 6),
                          Text(
                            'Main Account',
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
                      '\$4,280.90',
                      style: text.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                        fontFeatures: const [FontFeature.tabularFigures()],
                        letterSpacing: -0.4,
                      ),
                    ),
                  ],
                ),
              ),
              // Trend
              ElevatedButton.icon(
                onPressed: () {
                  debugPrint("Change account tapped");
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
                      '+\$1,240',
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
                      '-\$560',
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

          // Recent list
          txnRow(
            icon: Icons.local_grocery_store_rounded,
            title: 'Grocery Store',
            time: 'Today • 2:30 PM',
            amount: '-\$45.20',
            isNegative: true,
          ),
          const SizedBox(height: 8),
          txnRow(
            icon: Icons.directions_bus_filled_rounded,
            title: 'Metro Top-up',
            time: 'Today • 1:05 PM',
            amount: '-\$20.00',
            isNegative: true,
          ),
          const SizedBox(height: 8),
          txnRow(
            icon: Icons.attach_money_rounded,
            title: 'Salary',
            time: 'Yesterday • 9:00 AM',
            amount: '+\$3,000.00',
            isNegative: false,
          ),
        ],
      ),
    );
  }
}
