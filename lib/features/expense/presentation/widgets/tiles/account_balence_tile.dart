import 'package:flutter/material.dart';
import 'package:track/features/expense/domain/repo/dashboard_repository.dart';
import 'package:track/features/expense/presentation/widgets/skeletons/badge_skeleton.dart';

class AccountBalancesTileContent extends StatelessWidget {
  final List<AccountBalanceItem> items;
  const AccountBalancesTileContent({super.key, this.items = const []});

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
              backgroundColor: accent.withValues(alpha: 0.12),
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
          const SizedBox(height: 12),
          if (items.isEmpty)
            Text(
              'No accounts yet',
              style: text.bodySmall?.copyWith(
                color: cs.onSurface.withValues(alpha: 0.6),
              ),
            )
          else ...[
            for (int i = 0; i < items.length; i++) ...[
              row(
                name: items[i].name,
                balance: '${items[i].currency}${items[i].balance.toStringAsFixed(2)}',
                accent: i == 0
                    ? cs.primary
                    : (i == 1
                        ? cs.secondary
                        : cs.tertiary),
              ),
              if (i != items.length - 1) const SizedBox(height: 8),
            ]
          ],
        ],
      ),
    );
  }
}
