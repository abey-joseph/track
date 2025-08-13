import 'package:flutter/material.dart';
import 'package:track/features/expense/presentation/widgets/skeletons/badge_skeleton.dart';
import 'package:track/features/expense/presentation/widgets/skeletons/chip_skeleton.dart';
import 'package:track/features/expense/presentation/widgets/skeletons/trx_row_skeleton.dart';

class TodayTxnTile extends StatelessWidget {
  const TodayTxnTile({super.key});

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
              //const SizedBox(height: 10),

              // 30-day indicator chip
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
                    Icon(Icons.calendar_month_rounded,
                        size: 16, color: cs.primary),
                    const SizedBox(width: 6),
                    Text('24 Today',
                        style: text.labelLarge?.copyWith(
                            color: cs.primary, fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          // Last 4 transactions (sample data)
          TrxRowSkeleton(
            icon: Icons.local_grocery_store_rounded,
            accent: cs.primary,
            title: 'Grocery Store',
            sub: 'Today • 2:30 PM',
            trailing: AmountChipSkeleton(amount: '-\$45.20', negative: true),
          ),
          const SizedBox(height: 8),
          TrxRowSkeleton(
            icon: Icons.directions_bus_filled_rounded,
            accent: cs.tertiary,
            title: 'Metro Top-up',
            sub: 'Today • 1:05 PM',
            trailing: AmountChipSkeleton(amount: '-\$20.00', negative: true),
          ),
          const SizedBox(height: 8),
          TrxRowSkeleton(
            icon: Icons.restaurant_rounded,
            accent: cs.secondary,
            title: 'Lunch',
            sub: 'Yesterday • 12:40 PM',
            trailing: AmountChipSkeleton(amount: '-\$12.90', negative: true),
          ),
          const SizedBox(height: 8),
          TrxRowSkeleton(
            icon: Icons.attach_money_rounded,
            accent: Colors.green,
            title: 'Salary',
            sub: 'Yesterday • 9:00 AM',
            trailing:
                AmountChipSkeleton(amount: '+\$3,000.00', negative: false),
          ),
        ],
      ),
    );
  }
}
