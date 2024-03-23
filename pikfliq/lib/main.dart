import 'package:flutter/material.dart';
import 'package:pikfliq/screens/HomeScreen.dart';
import 'package:pikfliq/screens/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        // Define your app's theme here
        // You can specify light and dark themes if needed
      ),
      initialRoute: '/', // Set the initial route to '/'
      routes: {
        '/': (context) => SplashScreen(), // Define the SplashScreen route
        '/home': (context) => HomeScreen(), // Define the HomeScreen route
      },
    );
  }
}
