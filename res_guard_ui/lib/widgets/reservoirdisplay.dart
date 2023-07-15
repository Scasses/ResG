import 'dart:math';

import 'package:flutter/material.dart';
import 'package:res_guard_ui/widgets/reservoirpainter.dart';

class ReservoirDisplay extends StatelessWidget {
  const ReservoirDisplay(
      {Key? key,
      required this.feet,
      required this.maxFeet,
      required this.currentTrajectory,
      required this.forecastTrajectory})
      : super(key: key);

  final double feet;
  final double maxFeet;
  final double currentTrajectory;
  final double forecastTrajectory;
  static const _blue = Color.fromRGBO(70, 70, 230, 1);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: ReservoirPainter(
              fillColor: _blue,
              currentFeet: feet,
              maxHeight: maxFeet,
              currentTrajectory: currentTrajectory,
              forecastTrajectory: forecastTrajectory),
          size: const Size(100, 200),
        ),
        const Positioned.fill(
          child: Align(
            alignment: Alignment(0, 0.8),
          ),
        ),
      ],
    );
  }
}
