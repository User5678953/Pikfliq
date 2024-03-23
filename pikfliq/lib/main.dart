import 'package:flutter/material.dart';
import 'package:pikfliq/screens/HomeScreen.dart';
import 'package:pikfliq/screens/SettingsScreen.dart';
import 'package:pikfliq/screens/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PikFliq',
      theme: ThemeData(
      ),
      initialRoute: '/', 
      routes: {
        '/': (context) => SplashScreen(), // Define the SplashScreen route
        '/home': (context) => HomeScreen(), // Define the HomeScreen route
        '/settings': (context) => SettingsScreen(), // Define the SettingsScreen route
      },
    );
  }
}
