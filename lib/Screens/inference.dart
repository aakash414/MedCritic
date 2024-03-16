import 'package:flutter/material.dart';
import 'package:frontendweb/Models/image_process.dart';

class InferenceScreen extends StatelessWidget {
  final String imagePath;
  String inference = '';
  InferenceScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) async {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inference Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(imagePath),
            Container(
              child: Text('Inference result$inference'),
            ),
            Text('Inference result$inference')
          ],
        ),
      ),
    );
  }
}