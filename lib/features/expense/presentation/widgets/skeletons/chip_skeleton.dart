import 'package:flutter/material.dart';

class AmountChipSkeleton extends StatelessWidget {
  final String amount;
  final bool negative;

  const AmountChipSkeleton(
      {super.key, required this.amount, required this.negative});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final fg = negative ? cs.error : Colors.green;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: fg.withOpacity(0.10),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        amount,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w700,
          color: fg,
          fontFeatures: const [FontFeature.tabularFigures()],
        ),
      ),
    );
  }
}
