import 'dart:ui';

import 'package:flutter/material.dart';

class TrapezoidPainter extends CustomPainter {
  final Color color;

  TrapezoidPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()..color = color;
    final smallTrapezoidPaint = Paint()..color = color;
    final clearPaint = Paint()..blendMode = BlendMode.clear;

    final double trapezoidWidth = 64.0;
    final double bigTrapezoidHeight = 6.0;
    final double smallTrapezoidHeight = 3.0;
    final double topOffset = 9.0;
    final double bottomOffset = 15.0;

    final double centerX = size.width / 2;

    final double leftX = centerX - trapezoidWidth / 2;
    final double rightX = centerX + trapezoidWidth / 2;

    Path bigTrapezoidPath = Path()
      ..moveTo(leftX, 0)
      ..lineTo(rightX, 0)
      ..lineTo(rightX - bottomOffset, bigTrapezoidHeight)
      ..lineTo(leftX + bottomOffset, bigTrapezoidHeight)
      ..close();

    Path smallTrapezoidPath = Path()
      ..moveTo(leftX + topOffset, 0)
      ..lineTo(rightX - topOffset, 0)
      ..lineTo(rightX - bottomOffset, smallTrapezoidHeight)
      ..lineTo(leftX + bottomOffset, smallTrapezoidHeight)
      ..close();

    canvas.saveLayer(Offset.zero & size, Paint());
    canvas.drawRect(Offset.zero & size, backgroundPaint);
    canvas.drawPath(bigTrapezoidPath, clearPaint);
    canvas.restore();
    canvas.save();
    canvas.clipPath(smallTrapezoidPath);
    canvas.drawPath(smallTrapezoidPath, smallTrapezoidPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class Trapezoid extends StatelessWidget {
  final Widget child;
  final Color color;

  const Trapezoid({super.key, required this.child, required this.color});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
      child: CustomPaint(
        painter: TrapezoidPainter(color: color),
        child: Padding(padding: const EdgeInsets.only(top: 16), child: child),
      ),
    );
  }
}
