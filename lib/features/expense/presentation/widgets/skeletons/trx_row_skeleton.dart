import 'package:flutter/material.dart';

class TrxRowSkeleton extends StatelessWidget {
  final IconData icon;
  final Color accent;
  final String title;
  final String sub;
  final Widget trailing;
  const TrxRowSkeleton(
      {super.key,
      required this.icon,
      required this.accent,
      required this.title,
      required this.sub,
      required this.trailing});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: cs.primary.withOpacity(0.10),
          child: Icon(icon, size: 18, color: accent),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style:
                      text.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(height: 2),
              Text(sub,
                  style: text.bodySmall
                      ?.copyWith(color: cs.onSurface.withOpacity(0.6))),
            ],
          ),
        ),
        trailing,
      ],
    );
  }
}
