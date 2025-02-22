import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme() {
  return ThemeData.dark().copyWith(
      appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
      navigationBarTheme: NavigationBarThemeData(
          backgroundColor: ThemeData.dark().scaffoldBackgroundColor),
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ));
}
