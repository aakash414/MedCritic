import 'package:flutter/material.dart';
import 'package:frontendweb/Screens/dashboard.dart';
import 'package:frontendweb/Screens/home_page.dart';
import 'package:frontendweb/Screens/input_form.dart';
import 'package:frontendweb/Screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFA79F9F),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Med Critics',
      initialRoute: '/input',
      routes: {
        '/login': (context) => const LoginPage(),
        '/dashboard': (context) => const Dashboard(),
        '/home': (context) => const HomePage(),
        '/input': (context) => InputForm(),
      },
    );
  }
}