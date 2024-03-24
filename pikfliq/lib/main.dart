import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pikfliq/screens/HomeScreen.dart';
import 'package:pikfliq/screens/SettingsScreen.dart';
import 'package:pikfliq/screens/SplashScreen.dart';
import 'dart:async';

Future<void> main() async {
  // Check if the app is not running on the web before loading .env file
  if (!kIsWeb) {
    await dotenv.load(fileName: ".env");
     print("API Key: ${dotenv.env['TMDB_API_KEY']}");
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PikFliq',
      theme: ThemeData(),
      initialRoute: '/', 
      routes: {
        '/': (context) => SplashScreen(), // Define the SplashScreen route
        '/home': (context) => HomeScreen(), // Define the HomeScreen route
        '/settings': (context) => SettingsScreen(), // Define the SettingsScreen route
      },
    );
  }
}
