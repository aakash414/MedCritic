import 'package:flutter/material.dart';
import 'package:frontendweb/Screens/dashboard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var _selectedIndex;
    final _widgetOptions = <Widget>[
      const Dashboard(),
      const CameraPage(),
      const Text('Reports'),
    ];
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex)
,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
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
        ),
      ),
    );
  }
}
