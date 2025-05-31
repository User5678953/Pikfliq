 import 'package:flutter/material.dart';

class PikfliqThemeData {
  static ThemeData get lightTheme {
    // Light theme with green accents
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF1B5E20), // A vibrant green for primary content
        secondary: Color(0xFF4CAF50), // A slightly lighter green for accents
        surface: Color(0xFFFFFFFF), // White for general backgrounds
        onPrimary: Colors.white, // White text/icons on primary color background
        onSecondary: Colors.black, // Black text/icons on secondary color background
        onSurface: Color(0xFF1B5E20), // Green text/icons on white background for contrast
      ),
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(
        color: Color(0xFF1B5E20), // Green AppBar
        iconTheme: IconThemeData(color: Colors.white), // White icons for visibility
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconTheme: const IconThemeData(
        color: Color(0xFF1B5E20), // Mainly green icons for consistency
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Color(0xFF1B5E20), fontSize: 24, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(color: Color(0xFF4CAF50)),
        bodyMedium: TextStyle(color: Color(0xFF1B5E20), fontSize: 14),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF4CAF50)), // Green borders for input fields
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    // Dark theme with a darker shade of green for a more subdued, cinema-like feel
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF004D40), // A much darker green, almost teal, for primary content
        secondary: Color(0xFF00796B), // A slightly lighter shade for accents
        surface: Color(0xFF000000), // Black for general backgrounds
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
      ),
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(
        color: Color(0xFF004D40), // Dark green AppBar for a uniform look
        iconTheme: IconThemeData(color: Colors.white), // Ensuring icons are visible
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconTheme: const IconThemeData(
        color: Color(0xFF00796B), // Icons in a lighter shade for contrast against the dark background
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white, fontSize: 14),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF00796B)), // Darker green borders for inputs
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}