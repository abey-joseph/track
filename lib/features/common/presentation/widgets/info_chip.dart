import 'package:flutter/material.dart';

class InfoChip extends StatelessWidget {
  final String label;
  final EdgeInsetsGeometry padding;
  final double radius;

  const InfoChip({
    super.key,
    required this.label,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    this.radius = 24,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Text(label, style: theme.textTheme.labelSmall),
    );
  }
}


