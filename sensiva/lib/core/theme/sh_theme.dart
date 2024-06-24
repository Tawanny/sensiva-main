import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'th_colors.dart';

abstract class SHTheme {
  static ThemeData dark = ThemeData(
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.gruppo(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: ThemeColors.textColor,
      ),
      bodyMedium: GoogleFonts.gruppo(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: ThemeColors.textColor,
      ),
      bodySmall: GoogleFonts.montserrat(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: ThemeColors.textColor,
      ),
      displayLarge: GoogleFonts.buda(
        fontSize: 70,
        color: ThemeColors.textColor,
      ),
      displayMedium: GoogleFonts.buda(
        fontSize: 50,
        color: ThemeColors.textColor,
      ),
      displaySmall: GoogleFonts.buda(
        fontSize: 40,
        color: ThemeColors.textColor,
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
    iconTheme: const IconThemeData(color: ThemeColors.textColor),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        shape: const StadiumBorder(),
        textStyle: GoogleFonts.montserrat(
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
    sliderTheme: const SliderThemeData(
      activeTrackColor: ThemeColors.selectedColor,
      inactiveTrackColor: ThemeColors.trackColor,
      thumbColor: ThemeColors.selectedColor,
      trackHeight: 2,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedIconTheme: const IconThemeData(size: 40),
      unselectedIconTheme: const IconThemeData(size: 40),
      selectedItemColor: ThemeColors.hintColor,
      unselectedItemColor: ThemeColors.hintColor,
      selectedLabelStyle: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
      unselectedLabelStyle: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
    ),
    scaffoldBackgroundColor: ThemeColors.backgroundColor,
  );
}
