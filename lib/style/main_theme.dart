import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartbin/style/colors.dart';

ThemeData mainTheme(BuildContext context) =>
  ThemeData(
    scaffoldBackgroundColor: background,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
    ),
    textTheme: GoogleFonts.mulishTextTheme(
      Theme.of(context).textTheme
    ).apply(bodyColor: Colors.black),
    inputDecorationTheme: InputDecorationTheme(
      errorBorder: OutlineInputBorder(),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3.0),
        borderSide: BorderSide(color: const Color.fromARGB(255, 232, 108, 99)),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3.0),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3.0),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      filled: true,
      fillColor: Colors.grey.shade300,
      hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 15),
    ),
    iconTheme: IconThemeData(
      color: white
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.0),
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(primary),
        foregroundColor: WidgetStateProperty.all<Color>(white),
        side: WidgetStateProperty.all<BorderSide>(BorderSide(color: primary)),
      ),
    ),
  );