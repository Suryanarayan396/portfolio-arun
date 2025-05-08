
// widgets/circular_skill_indicator.dart - Skill indicator
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:webportf/apptheme.dart';


class CircularSkillIndicator extends StatelessWidget {
  final String skill;
  final double percentage;
  final double size;
  final Color backgroundColor;

  const CircularSkillIndicator({
    Key? key,
    required this.skill,
    required this.percentage,
    this.size = 100,
    this.backgroundColor = const Color(0xffffffff),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size + 40,
          height: size + 60,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size,
                height: size,
                child: CustomPaint(
                  painter: DashedCircularPainter(
                    percentage: percentage,
                    activeColor: AppTheme.primaryColor,
                    inactiveColor: Colors.grey[400]!,
                  ),
                  child: Center(
                    child: Text(
                      '$percentage%',
                      style: TextStyle(
                        fontSize: size * 0.25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                skill,
                style: TextStyle(
                  fontSize: size * 0.2,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DashedCircularPainter extends CustomPainter {
  final double percentage;
  final Color activeColor;
  final Color inactiveColor;
  final int segments;

  DashedCircularPainter({
    required this.percentage,
    required this.activeColor,
    required this.inactiveColor,
    this.segments = 10,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = size.width * 0.08;
    final radius = (size.width / 2) - strokeWidth / 2;
    final center = Offset(size.width / 2, size.height / 2);

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;

    final anglePerSegment = 2 * pi / segments;
    final gapSize = 0.07;
    final paintedSegments = (segments * (percentage / 100)).floor();

  // Continued from previous code...
    for (int i = 0; i < segments; i++) {
      paint.color = i < paintedSegments ? activeColor : inactiveColor;
      double startAngle = i * anglePerSegment + gapSize;
      double sweepAngle = anglePerSegment - gapSize * 2;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
