import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  final Color? color;
  final String? text;
  final Function()? onPressed;
  final double width;
  final double height;
  const CalculateButton(
      {required this.color,
      required this.onPressed,
      required this.width,
      required this.height,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.0),
        ),
        elevation: 10.0,
        color: color,
        child: MaterialButton(
          elevation: 20.0,
          minWidth: width,
          height: 5.0,
          onPressed: onPressed,
          child: Text(
            text!,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
