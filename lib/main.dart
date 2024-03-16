// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:med_critics/Screens/camera_page.dart';
import 'package:med_critics/Screens/display_inference.dart';

import 'Screens/login_page.dart';
// import 'Screens/meta_mask_login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Med Critics',
      initialRoute: '/camera',
      routes: {
        '/login': (context) =>  const LoginPage(),
        '/camera': (context) => const CameraPreview(),
      },
      home: const LoginPage(),
    );
  }
}
