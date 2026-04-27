/*  
 *  Created by asandyputra on 16/04/2026.
 */

import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF1E4FA1); // biru
  static const Color secondary = Colors.green;
  static const Color danger = Colors.red;
  static const Color background = Colors.white;

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      primary: primary,
      secondary: secondary,
    ),
    scaffoldBackgroundColor: background,

    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    textTheme: const TextTheme(
      titleLarge: TextStyle(fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontSize: 14),
    ),
  );
}
