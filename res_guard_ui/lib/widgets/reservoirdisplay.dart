import 'package:flutter/material.dart';

class ReservoirDisplay extends StatelessWidget {
  const ReservoirDisplay({Key? key, required this.feet, required this.maxFeet})
      : super(key: key);

  final double feet;
  final double maxFeet;
  static const _blue = Color.fromRGBO(70, 70, 230, 1);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint()
      ],
    );
  }
}
