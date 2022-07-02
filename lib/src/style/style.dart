import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
      textTheme: TextTheme(
    headline1: GoogleFonts.aBeeZee(
      color: Color(0xFF2D0C57),
      fontSize: 30,
    ),
  ));
}
