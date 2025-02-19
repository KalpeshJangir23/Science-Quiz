import 'package:flutter/material.dart';
import 'package:quiz_science_app/theme/app_color.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      // Base Colors
      primaryColor: AppColor.mainHighLight,
      scaffoldBackgroundColor: AppColor.appBackground,

      // Color Scheme
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColor.mainHighLight,
        onPrimary: AppColor.whiteShade,
        secondary: AppColor.smallContainer,
        onSecondary: AppColor.textColor,
        error: Colors.red,
        onError: AppColor.whiteShade,
        surface: AppColor.largeContainer,
        onSurface: AppColor.textColor,
      ),

      // Text Theme
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: AppColor.textColor,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: AppColor.textColor,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          color: AppColor.textColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: AppColor.textColor,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: AppColor.textColor,
          fontSize: 14,
        ),
        bodySmall: TextStyle(
          color: AppColor.offshade,
          fontSize: 12,
        ),
      ),

      // Card Theme
      cardTheme: CardTheme(
        color: AppColor.smallContainer,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.largeContainer,
        foregroundColor: AppColor.textColor,
        elevation: 0,
      ),

      // Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.mainHighLight,
          foregroundColor: AppColor.whiteShade,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColor.smallContainer,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColor.mainHighLight),
        ),
        labelStyle: const TextStyle(color: AppColor.offshade),
        hintStyle: const TextStyle(color: AppColor.offshade),
      ),
    );
  }
}
