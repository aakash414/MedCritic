import 'package:flutter/material.dart';
import 'package:frontendweb/Screens/camera_screen.dart';
import 'package:frontendweb/Screens/dashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex=0;
    final widgetOptions = <Widget>[
      const Dashboard(),
       CameraPage(),
      const Text('Reports'),
    ];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: widgetOptions.elementAt(selectedIndex)
,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          backgroundColor: const Color(0xffD9D9D9),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),

              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_outlined),
              label: 'Camera',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_sharp),
              label: 'Reports',
            ),
          ],
          onTap: (value) {setState((){
            selectedIndex = value;});
          },
        ),
      ),
    );
  }
}
