import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String walletAddress = ''; // Store the retrieved wallet address here

  // Function to launch Metamask for login
  Future<void> _launchMetamask() async {
    const url = '';    // Replace with your data
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch Metamask.';
    }
  }

  // Function to handle the response when it comes back
  void _handleMetamaskResponse(String address) {
    setState(() {
      walletAddress = address;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Metamask Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _launchMetamask,
              child: const Text('Login with Metamask'),
            ),
            const SizedBox(height: 20),
            Text('Wallet Address: $walletAddress'),
          ],
        ),
      ),
    );
  }
}

