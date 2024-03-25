import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pikfliq/screens/HomeScreen.dart';
import 'package:pikfliq/screens/SettingsScreen.dart';
import 'package:pikfliq/screens/SplashScreen.dart';
import 'dart:async';

void main() async {
  // Load environment variables if not on the web
  if (!kIsWeb) {
    await dotenv.load(fileName: ".env");
  }
  
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          (_themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: HomeScreen(
        themeMode: _themeMode,
        toggleTheme: _toggleTheme,
      ),
    );
  }
}