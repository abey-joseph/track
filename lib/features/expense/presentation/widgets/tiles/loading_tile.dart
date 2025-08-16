import 'package:flutter/material.dart';

class LoadingTile extends StatelessWidget {
  final String? title;
  final int skeletonRows;
  final bool showShimmer;
  final EdgeInsetsGeometry? padding;
  
  const LoadingTile({
    super.key,
    this.title,
    this.skeletonRows = 3,
    this.showShimmer = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title section with skeleton
          if (title != null) ...[
            _buildTitleSkeleton(context, title!),
            const SizedBox(height: 16),
          ],
          
          // Skeleton rows
          ...List.generate(skeletonRows, (index) => 
            _buildSkeletonRow(context, index)
          ),
        ],
      ),
    );
  }

  Widget _buildTitleSkeleton(BuildContext context, String title) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.6),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildShimmerIcon(
            Icons.credit_card_rounded,
            size: 14,
            color: colorScheme.onSurface.withValues(alpha: 0.7),
          ),
          const SizedBox(width: 6),
          _buildShimmerText(
            title,
            style: textTheme.labelMedium?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.8),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkeletonRow(BuildContext context, int index) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    
    return Padding(
      padding: EdgeInsets.only(bottom: index < skeletonRows - 1 ? 8.0 : 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon skeleton
          _buildShimmerCircle(
            radius: 18,
            color: colorScheme.primary.withValues(alpha: 0.10),
          ),
          const SizedBox(width: 10),
          
          // Content skeleton
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title skeleton
                _buildShimmerText(
                  'Loading...',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                // Subtitle skeleton
                _buildShimmerText(
                  'Loading...',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(width: 12),
          
          // Amount skeleton
          _buildShimmerChip(
            'Loading...',
            colorScheme: colorScheme,
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerIcon(IconData icon, {double? size, Color? color}) {
    if (!showShimmer) {
      return Icon(icon, size: size, color: color);
    }
    
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          color?.withValues(alpha: 0.3) ?? Colors.grey.withValues(alpha: 0.3),
          color?.withValues(alpha: 0.7) ?? Colors.grey.withValues(alpha: 0.7),
          color?.withValues(alpha: 0.3) ?? Colors.grey.withValues(alpha: 0.3),
        ],
        stops: const [0.0, 0.5, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: Icon(icon, size: size, color: color),
    );
  }

  Widget _buildShimmerText(String text, {TextStyle? style}) {
    if (!showShimmer) {
      return Text(text, style: style);
    }
    
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          style?.color?.withValues(alpha: 0.3) ?? Colors.grey.withValues(alpha: 0.3),
          style?.color?.withValues(alpha: 0.7) ?? Colors.grey.withValues(alpha: 0.7),
          style?.color?.withValues(alpha: 0.3) ?? Colors.grey.withValues(alpha: 0.3),
        ],
        stops: const [0.0, 0.5, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: Text(text, style: style),
    );
  }

  Widget _buildShimmerCircle({required double radius, Color? color}) {
    if (!showShimmer) {
      return CircleAvatar(
        radius: radius,
        backgroundColor: color,
      );
    }
    
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          color?.withValues(alpha: 0.3) ?? Colors.grey.withValues(alpha: 0.3),
          color?.withValues(alpha: 0.7) ?? Colors.grey.withValues(alpha: 0.7),
          color?.withValues(alpha: 0.3) ?? Colors.grey.withValues(alpha: 0.3),
        ],
        stops: const [0.0, 0.5, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: color,
      ),
    );
  }

  Widget _buildShimmerChip(
    String text, {
    required ColorScheme colorScheme,
    required TextTheme textTheme,
  }) {
    final chipBg = colorScheme.primary.withValues(alpha: 0.08);
    final chipFg = colorScheme.primary;
    
    if (!showShimmer) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: chipBg,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: chipFg,
            fontFeatures: const [FontFeature.tabularFigures()],
            letterSpacing: -0.2,
          ),
        ),
      );
    }
    
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          chipBg.withValues(alpha: 0.3),
          chipBg.withValues(alpha: 0.7),
          chipBg.withValues(alpha: 0.3),
        ],
        stops: const [0.0, 0.5, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: chipBg,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: chipFg,
            fontFeatures: const [FontFeature.tabularFigures()],
            letterSpacing: -0.2,
          ),
        ),
      ),
    );
  }
}

// Convenience widget for simple loading states
class SimpleLoadingTile extends StatelessWidget {
  final String? message;
  final EdgeInsetsGeometry? padding;
  
  const SimpleLoadingTile({
    super.key,
    this.message,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Padding(
      padding: padding ?? const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
            ),
            if (message != null) ...[
              const SizedBox(height: 16),
              Text(
                message!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
