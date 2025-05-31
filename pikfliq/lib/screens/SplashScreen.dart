import 'dart:async'; // Ensure you have this import for the Timer
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    _simulateLoading();
  }

  void _simulateLoading() {
    const oneSec = Duration(milliseconds: 500);
    Timer.periodic(oneSec, (Timer timer) {
      if (_progressValue >= 1) {
        timer.cancel();
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        setState(() {
          _progressValue += 0.1; // Increment the progress value
        });
      }
    });
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
            Image.asset(
              'assets/PikLogo.png', // Replace with your actual logo path
              width: screenSize.width * 0.6, // Adjust the width as needed
              height: screenSize.height * 0.3, // Adjust the height as needed
              fit: BoxFit.contain,
            ),
            SizedBox(height: screenSize.height * 0.05), // Space between logo and progress bar
            SizedBox(
              // Constrain the width of the progress bar
              width: screenSize.width * 0.7, // Adjust the width to 70% of screen width
              child: LinearProgressIndicator(
                value: _progressValue,
                backgroundColor: Colors.grey,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                minHeight: 12, // Adjust the thickness of the progress bar
              ),
            ),
          ],
        ),
      ),
    );
  }
}
