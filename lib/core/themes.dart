import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFF0D315C),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF0D315C),
      secondary: Color(0xFFFF6A00),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontFamily: 'SFProDisplay',
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Lora',
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
}
