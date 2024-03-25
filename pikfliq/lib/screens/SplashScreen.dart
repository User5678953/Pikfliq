import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

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
    await Future.delayed(const Duration(seconds: 5));

    // Navigate to the home screen using a named route
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size; // Get the current screen size

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Constrain the size of the splash image based on screen size
            Image.asset(
              'assets/WebbyWebDevGraphic.jpg',
              width: screenSize.width * (screenSize.width < 600 ? 0.8 : 0.5), // Smaller width for mobile screens
              height: screenSize.height * (screenSize.width < 600 ? 0.8 : 0.5), // Smaller height for mobile screens
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20), // Provide some spacing between the image and the progress indicator
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
