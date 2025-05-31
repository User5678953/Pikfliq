import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pikfliq/screens/FavoritesWatchlistScreen.dart';
import 'package:pikfliq/screens/HomeScreen.dart';
import 'package:pikfliq/screens/SettingsScreen.dart';
import 'package:pikfliq/screens/SplashScreen.dart';
import 'dart:async';

void main() async {
  // Ensure proper initializations when not running in web environment
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await dotenv.load(fileName: ".env");
  }
  
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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
      // Update the initialRoute to point to the SplashScreen
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => HomeScreen(
              themeMode: _themeMode,
              toggleTheme: _toggleTheme,
            ),
        '/favoritesWatchlist': (context) => const FavoritesWatchlistScreen(),
        '/settings': (context) => const SettingsScreen(),
        // Add other routes as needed
      },
    );
  }
}
