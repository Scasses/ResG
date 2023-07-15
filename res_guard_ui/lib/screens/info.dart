import 'package:flutter/material.dart';

class DataInfo extends StatefulWidget {
  const DataInfo({Key? key}) : super(key: key);

  @override
  State<DataInfo> createState() => _DataInfoState();
}

class _DataInfoState extends State<DataInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('Data Page', style: TextStyle(color: Colors.white)),
    );
  }
}
