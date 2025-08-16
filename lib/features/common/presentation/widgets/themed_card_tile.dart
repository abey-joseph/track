import 'package:flutter/material.dart';

class ThemedCardTile extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final List<Widget>? badges;
  final List<Widget>? trailingActions;
  final double elevation;
  final double borderRadius;
  final EdgeInsetsGeometry contentPadding;
  final Color? backgroundColor;

  const ThemedCardTile({
    super.key,
    this.onTap,
    this.leading,
    this.title,
    this.subtitle,
    this.badges,
    this.trailingActions,
    this.elevation = 2,
    this.borderRadius = 16,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: elevation,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
      color: backgroundColor ?? theme.colorScheme.surface,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Padding(
          padding: contentPadding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (leading != null) leading!,
              if (leading != null) const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null) title!,
                    if (subtitle != null) ...[
                      const SizedBox(height: 6),
                      subtitle!,
                    ],
                    if (badges != null && badges!.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      Wrap(
                        spacing: 8,
                        runSpacing: -6,
                        children: badges!,
                      ),
                    ],
                  ],
                ),
              ),
              if (trailingActions != null && trailingActions!.isNotEmpty) ...[
                const SizedBox(width: 8),
                Row(mainAxisSize: MainAxisSize.min, children: _withSpacing(trailingActions!)),
              ],
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _withSpacing(List<Widget> widgets) {
    final List<Widget> children = [];
    for (var i = 0; i < widgets.length; i++) {
      children.add(widgets[i]);
      if (i != widgets.length - 1) {
        children.add(const SizedBox(width: 6));
      }
    }
    return children;
  }
}


