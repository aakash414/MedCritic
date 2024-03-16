import 'package:flutter/material.dart';
import 'dart:io';

class DisplayInference extends StatelessWidget {
  final String path;
  final String result;
  const DisplayInference({super.key, required this.path, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.file(File(path)),
            Text(result),
          ],
        ),
      ),
    );
  }
}