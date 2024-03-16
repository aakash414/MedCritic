import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontendweb/Screens/inference.dart';
import 'package:image_picker/image_picker.dart';


class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? _imageFile;

  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
       Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InferenceScreen(imagePath: File(pickedImage.path).path),
        ),
      );
    }
  }

  Future<void> _takeImageFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });

      // Redirect to the inference page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InferenceScreen(imagePath: File(pickedImage.path).path),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _pickImageFromGallery,
              child: const Text('Pick Image from Gallery'),
            ),
            ElevatedButton(
              onPressed: _takeImageFromCamera,
              child: const Text('Take Image from Camera'),
            ),
          ],
        ),
      ),
    );
  }
}