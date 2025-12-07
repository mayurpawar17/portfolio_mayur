import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.interTextTheme(),
    primaryColor: Colors.black,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0D0D0D),
    textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
    primaryColor: Colors.white,
  );
}
