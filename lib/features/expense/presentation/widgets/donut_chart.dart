import 'package:flutter/material.dart';
import 'package:track/features/expense/domain/entities/helper_classes/account_details_helpers.dart';

class DonutChart extends StatelessWidget {
  final DonutChartData data;

  const DonutChart({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DonutChartPainter(data: data),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Net',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '\$${(data.incomingAmount + data.outgoingAmount).toStringAsFixed(0)}',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: (data.incomingAmount - data.outgoingAmount) >= 0 
                  ? Colors.green 
                  : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DonutChartPainter extends CustomPainter {
  final DonutChartData data;

  DonutChartPainter({required this.data});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width < size.height ? size.width : size.height) / 2 - 20;
    final strokeWidth = 20.0;
    
    // Draw background circle
    final backgroundPaint = Paint()
      ..color = Colors.grey.withValues(alpha: 0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    
    canvas.drawCircle(center, radius, backgroundPaint);
    
    // Calculate angles
    if (data.incomingPercentage + data.outgoingPercentage == 0) return;

    final incomingAngle = (data.incomingPercentage / 100) * 2 * 3.14159;
    final outgoingAngle = (data.outgoingPercentage / 100) * 2 * 3.14159;
    
    // Draw incoming arc (green)
    if (data.incomingPercentage > 0) {
      final incomingPaint = Paint()
        ..color = Colors.green
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;
      
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -3.14159 / 2, // Start from top
        incomingAngle,
        false,
        incomingPaint,
      );
    }
    
    // Draw outgoing arc (red)
    if (data.outgoingPercentage > 0) {
      final outgoingPaint = Paint()
        ..color = Colors.red
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;
      
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -3.14159 / 2 + incomingAngle, // Start after incoming arc
        outgoingAngle,
        false,
        outgoingPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
