import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          primary: const Color(0xFFFF97B7),
          elevation: 0,
          onPrimary: Colors.white,
        ),
      ),
      textTheme: TextTheme(
        headline1: GoogleFonts.aBeeZee(
          color: const Color(0xFF2D0C57),
          fontSize: 30,
        ),
        subtitle1: GoogleFonts.aBeeZee(
          color: const Color(0xFF2D0C57),
          fontSize: 18,
        ),
        subtitle2: GoogleFonts.aBeeZee(
          color: const Color(0xFF2D0C57),
          fontSize: 14,
        ),
        bodyText1: GoogleFonts.aBeeZee(
          color: const Color(0xFF9586A8),
          fontSize: 12,
        ),
        bodyText2: GoogleFonts.aBeeZee(
          fontSize: 15,
        ),
      ));
}
