import 'package:flutter/material.dart';
import 'package:track/features/expense/presentation/widgets/skeletons/badge_skeleton.dart';

class AccountBalancesTileContent extends StatelessWidget {
  const AccountBalancesTileContent({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    Widget row({
      required String name,
      required String balance,
      required Color accent,
    }) {
      return Row(
        children: [
          CircleAvatar(
              radius: 16,
              backgroundColor: accent.withOpacity(0.12),
              child:
                  Icon(Icons.account_balance_wallet, size: 18, color: accent)),
          const SizedBox(width: 12),
          Expanded(
              child: Text(name,
                  style:
                      text.titleSmall?.copyWith(fontWeight: FontWeight.w600))),
          Text(
            balance,
            style: text.titleSmall?.copyWith(
              fontFeatures: const [FontFeature.tabularFigures()],
              fontWeight: FontWeight.w700,
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
          TitleBadgeSkeleton(label: 'Account Balance'),
          const SizedBox(height: 10),
          // Text('Account Balance',
          //     style: text.headlineSmall?.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 12),
          row(name: 'Savings', balance: '\$4,280.90', accent: cs.primary),
          const SizedBox(height: 8),
          row(name: 'Everyday', balance: '\$1,120.40', accent: cs.secondary),
          const SizedBox(height: 8),
          row(name: 'Travel', balance: '\$560.25', accent: cs.tertiary),
        ],
      ),
    );
  }
}
