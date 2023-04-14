import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    primaryColor: const Color(0xFFf88941),
    scaffoldBackgroundColor: const Color(0xFFececed),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Color(0xFFb6b6b6),
      ),
      headlineSmall: TextStyle(
        color: Color(0xFF0c0c0c),
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: Color(0xFF0c0c0c),
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
