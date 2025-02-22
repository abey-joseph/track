import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme() {
  return ThemeData.light().copyWith(
      appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black)),
      navigationBarTheme: NavigationBarThemeData(
          backgroundColor: ThemeData.light().scaffoldBackgroundColor),
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: Colors.black,
        displayColor: Colors.black,
      ));
}
