import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1F3B4D),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          ListTile(
            leading: Icon(Icons.man_outlined),
            title: Text(
              'P. Corban',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Chief Plant Operator',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
