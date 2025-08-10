import 'package:flutter/material.dart';

class TileSkeleton extends StatelessWidget {
  final Widget child;
  const TileSkeleton({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        color: Theme.of(context).colorScheme.surface,
        elevation: 3,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
