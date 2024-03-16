import 'package:flutter/material.dart';
import 'package:flutter_camera/flutter_camera.dart';
import 'package:med_critics/Models/image_process.dart';
import 'dart:io';

import 'package:med_critics/Screens/display_inference.dart';

class CameraPreview extends StatelessWidget {
  const CameraPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterCamera(
        color: Colors.black,
        iconColor: Colors.white,
        onImageCaptured: (value) async {
          final path = value.path;
          print("::::::::::::::::::::::::::::::::: $path");
          if (path.contains('.jpg')) {
            showDialog(
                context: context,
                builder: (context) {
                  return FutureBuilder<String?>(
                    future: ImageProcess().imageProcess(path),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final result = snapshot.data ?? '';
                        if (result!=''){() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DisplayInference(
                                    path: path, result: result),
                              ));
                        };} // Using null-aware operator
                        return const AlertDialog();
                      }
                    },
                  );
                });
          }
        },
      ),
    );
  }
}
