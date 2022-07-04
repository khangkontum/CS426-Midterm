import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
      cardTheme: CardTheme(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      backgroundColor: const Color(0xFFFF97B7),
      inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)))),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        primary: const Color(0xFFFF97B7),
        textStyle: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(fontWeight: FontWeight.bold),
        side: const BorderSide(color: Color(0xFFFF97B7)),
      )),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
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
        headline2: GoogleFonts.aBeeZee(
          color: const Color(0xFF2D0C57),
          fontSize: 24,
        ),
        subtitle1: GoogleFonts.aBeeZee(
          color: const Color(0xFF2D0C57),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        subtitle2: GoogleFonts.aBeeZee(
            color: const Color(0xFF2D0C57),
            fontSize: 14,
            fontWeight: FontWeight.w300),
        bodyText1: GoogleFonts.aBeeZee(
          color: const Color(0xFF9586A8),
          fontSize: 12,
        ),
        bodyText2: GoogleFonts.aBeeZee(
          fontSize: 15,
        ),
      ));
}
