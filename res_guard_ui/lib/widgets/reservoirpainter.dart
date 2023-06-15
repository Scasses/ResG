import 'dart:ui';

import 'package:flutter/material.dart';

class ReservoirPainter extends CustomPainter {
  ReservoirPainter(
      {required this.fillColor,
      required this.currentFeet,
      required this.maxHeight,
      required this.currentTrajectory,
      required this.forecastTrajectory});

  final double currentFeet;
  final double maxHeight;
  final double currentTrajectory;
  final double forecastTrajectory;
  final Color fillColor;
  static const double width = 22;

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double liquidTop = lerpDouble(150.0, 40.0, currentFeet / maxHeight)!;
    _paintLiquid(canvas, centerX, liquidTop);
    _paintReservoirOutline(centerX, canvas);
    _paintText(size, canvas, liquidTop);
    _paintLiquidLevelLine(canvas, liquidTop, centerX);
  }

  void _paintLiquid(Canvas canvas, double centerX, double liquidTop) {
    canvas.save();
    canvas.clipPath(_getReservoirPath(
      centerX: centerX,
    ));
    final Paint fillPaint = Paint()..color = fillColor;
    canvas.drawRect(Rect.fromLTWH(0, liquidTop, 100, 100), fillPaint);
    canvas.restore();
  }

  void _paintReservoirOutline(double centerX, Canvas canvas) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;
    final Path path = _getReservoirPath(
      centerX: centerX,
    );
    canvas.drawPath(path, paint);
  }

  void _paintText(Size size, Canvas canvas, double liquidTop) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: currentFeet.toStringAsFixed(0),
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
      ),
      textAlign: TextAlign.justify,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: size.width - 12 * 2);
    textPainter.paint(
      canvas,
      Offset(12, liquidTop - 14),
    );
  }

  void _paintLiquidLevelLine(Canvas canvas, double liquidTop, double centerX) {
    final Paint linePaint = Paint()
      ..strokeWidth = 0.7
      ..color = Colors.black;
    canvas.drawLine(Offset(10, liquidTop),
        Offset(centerX + width / 2, liquidTop), linePaint);
  }

  Path _getReservoirPath({
    required double centerX,
  }) =>
      Path()
        ..moveTo(centerX - width / 2, 40)
        ..lineTo(centerX - width / 2, 120)
        ..lineTo(centerX - 2, 149)
        ..lineTo(centerX, 150)
        ..lineTo(centerX + 2, 149)
        ..lineTo(centerX + width / 2, 120)
        ..lineTo(centerX + width / 2, 40)
        ..lineTo(centerX - width / 2, 40);

  @override
  bool shouldRepaint(covariant ReservoirPainter oldDelegate) {
    return currentFeet != oldDelegate.currentFeet ||
        maxHeight != oldDelegate.maxHeight;
  }
}
