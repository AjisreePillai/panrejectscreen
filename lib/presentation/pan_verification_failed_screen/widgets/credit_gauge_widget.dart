import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

/// Semicircle credit gauge with a "Free" tag, painted with a CustomPainter.
class CreditGaugeWidget extends StatelessWidget {
  final double size;
  const CreditGaugeWidget({super.key, this.size = 96});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Credit score gauge, free report',
      child: SizedBox(
        width: size,
        height: size * 0.78,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(child: CustomPaint(painter: _GaugePainter())),
            Positioned(
              bottom: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.orange,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Free',
                  style: TextStyle(
                    color: AppTheme.textOnPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * 0.78);
    final radius = size.width * 0.44;
    final rect = Rect.fromCircle(center: center, radius: radius);
    const stroke = 11.0;

    final colors = [
      const Color(0xFFD64545),
      const Color(0xFFF58A2B),
      const Color(0xFFF2C230),
      const Color(0xFF7CC04B),
      const Color(0xFF1E8E3E),
    ];
    final sweepEach = math.pi / colors.length;
    for (var i = 0; i < colors.length; i++) {
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke
        ..strokeCap = StrokeCap.butt
        ..color = colors[i];
      canvas.drawArc(
        rect,
        math.pi + i * sweepEach + 0.02,
        sweepEach - 0.04,
        false,
        paint,
      );
    }

    // needle
    const needleAngle = math.pi + math.pi * 0.7;
    final tip = Offset(
      center.dx + (radius - stroke) * math.cos(needleAngle),
      center.dy + (radius - stroke) * math.sin(needleAngle),
    );
    final needle = Paint()
      ..color = AppTheme.navy
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(center, tip, needle);
    canvas.drawCircle(center, 6, Paint()..color = AppTheme.navy);
    canvas.drawCircle(center, 2.5, Paint()..color = AppTheme.surface);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
