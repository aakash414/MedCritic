import 'package:flutter/material.dart';
import"package:web3dart/web3dart.dart";
import 'package:http/http.dart';
import'package:flutter_web3/flutter_web3.dart';
import'package:frontendweb/Screens/login_page.dart';
Widget build(BuildContext context) {
  final address = LoginPage().useraddress();
  
  return Scaffold(
    // ...
    body: Center(
      child: FutureBuilder<UserData>(
        future: getUserData(address), // Replace with actual user address
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!;
            return Column(
              children: [
                Text('Name: ${userData.name}'),
                Text('Age: ${userData.age}'),
                Text('Height: ${userData.height}'),
                Text('Weight: ${userData.weight}'),
                Text('Blood Group: ${userData.bloodGroup}'),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),
    ),
  );
}