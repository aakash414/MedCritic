// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:med_critics/Screens/camera_page.dart';
import 'package:med_critics/Screens/display_inference.dart';
import 'package:med_critics/Screens/home.dart';

import 'Screens/login_page.dart';
// import 'Screens/meta_mask_login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Med Critics',
      initialRoute: '/home',
      routes: {
        '/login': (context) => LoginPage(),
        '/camera': (context) => const CameraPage(),
        '/home': (context) => const HomePage()
        // Routes.addChainRoute: (context) => const AddChainScreen(),
      },
    );
  }
}
