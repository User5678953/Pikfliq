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
    // Simulate a 5-second delay
    await Future.delayed(Duration(seconds: 5));

    // Navigate to the home screen using a named route
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Change this to black to complement full screen media
      body: Stack(
        fit: StackFit.expand, // Ensure the stack takes the full screen
        children: [
          // Full-screen splash image
          Image.asset('assets/WebbyWebDevGraphic.jpg', fit: BoxFit.cover),
          // Positioned progress indicator at the bottom right
          Positioned(
            bottom: 20,
            right: 20,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white), // Making the indicator white
            ),
          ),
        ],
      ),
    );
  }
}
