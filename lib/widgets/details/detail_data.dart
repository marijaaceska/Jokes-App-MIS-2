import 'package:flutter/material.dart';

class DetailData extends StatelessWidget {
  final String data;

  const DetailData({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
        data,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.blue[200]),
        textAlign: TextAlign.start,
      ),
    );
  }
}