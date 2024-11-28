import 'package:flutter/material.dart';

class AppTheme {
  // Primary colors
  static const Color primaryWhite = Colors.white;
  static const Color primaryBlack = Colors.black;
  static const Color primaryOrange = Color(0xFFFF9800);
  static const Color primaryPink = Color(0xFFE91E63);
  static const Color primaryGreen = Color(0xFF4CAF50);

  // Create the theme data
  static ThemeData themeData = ThemeData(
    // Base colors
    primaryColor: primaryOrange,
    scaffoldBackgroundColor: primaryWhite,

    // AppBar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryOrange,
      foregroundColor: primaryWhite,
      elevation: 0,
    ),

    // Text theme
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: primaryBlack),
      displayMedium: TextStyle(color: primaryBlack),
      bodyLarge: TextStyle(color: primaryBlack),
      bodyMedium: TextStyle(color: primaryBlack),
    ),

    // Button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryOrange,
        foregroundColor: primaryWhite,
      ),
    ),

    // Color scheme
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: primaryOrange,
      onPrimary: primaryWhite,
      secondary: primaryPink,
      onSecondary: primaryWhite,
      error: Colors.red,
      onError: primaryWhite,
      background: primaryWhite,
      onBackground: primaryBlack,
      surface: primaryWhite,
      onSurface: primaryBlack,
    ),
  );
}