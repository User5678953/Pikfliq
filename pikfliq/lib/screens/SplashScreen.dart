import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  Future<void> navigateToHome() async {
    // Simulate some delay for the splash screen
    await Future.delayed(Duration(seconds: 3));

    // Navigate to the home screen using named route
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set your background color here
      body: Center(
        child: CircularProgressIndicator(), // Add your splash screen UI here
      ),
    );
  }
}
