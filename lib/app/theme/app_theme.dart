import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    const primary = Color(0xFF001845);
    const secondary = Color(0xFFF97316);
    const offWhite = Color(0xFFF2F0EF);

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: Brightness.light,
        primary: primary,
        secondary: secondary,
        surface: offWhite,
      ),
      scaffoldBackgroundColor: Color(0xFFF2F0EF),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontWeight: FontWeight.w800, height: 1.05),
        headlineMedium: TextStyle(fontWeight: FontWeight.w700),
        titleLarge: TextStyle(fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(height: 1.4),
      ),
    );
  }
}
