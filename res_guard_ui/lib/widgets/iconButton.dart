import 'package:flutter/material.dart';

class IconButton extends StatelessWidget {
  Color? color;
  Icon? icon;
  String? contact;
  Function()? onClicked;

  IconButton(
      {required this.color,
      required this.icon,
      required this.contact,
      required this.onClicked});

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
          minWidth: 15,
          height: 5.0,
          onPressed: onClicked,
          child: Text(
            contact!,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
