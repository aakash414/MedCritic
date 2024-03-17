import 'package:flutter/material.dart';
import 'package:frontendweb/Models/image_process.dart';

class InferenceScreen extends StatefulWidget {
  final String imagePath;
  final String? inference = null;

  InferenceScreen({required this.imagePath});

  @override
  _InferenceScreenState createState() => _InferenceScreenState();
}

class _InferenceScreenState extends State<InferenceScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inference Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(widget.imagePath),
            FutureBuilder<String?>(
              future: ImageProcess(). imageProcess(widget.imagePath),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Text('Inference result: ${snapshot.data}');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
