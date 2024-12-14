import 'package:flutter/material.dart';

class DetailTitle extends StatelessWidget {
  final String title;

  const DetailTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.blue[500]),
          textAlign: TextAlign.start,
        ),
    );
  }
}