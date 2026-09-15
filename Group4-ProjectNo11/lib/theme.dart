import 'package:flutter/material.dart';

const ink = Color(0xFF18243A);
const muted = Color(0xFF6B7485);
const blue = Color(0xFF3259D6);

ThemeData buildRideFlowTheme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFF6F7F9),
    colorScheme: ColorScheme.fromSeed(seedColor: blue).copyWith(
      primary: blue,
      surface: Colors.white,
    ),
    fontFamily: 'Arial',
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      surfaceTintColor: Colors.transparent,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      hintStyle: TextStyle(color: Color(0xFF9AA2B1), fontSize: 14),
      errorStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    ),
  );
}
