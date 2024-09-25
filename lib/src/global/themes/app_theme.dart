import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';
import '../utils/padding.dart';

ThemeData appTheme() {
  return ThemeData(
    // Define the default brightness and colors.
    appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 255, 255, 255)),
    // primarySwatch: Colors.blue,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    primaryColorDark: AppColors.primary,
    scaffoldBackgroundColor: const Color.fromARGB(255, 251, 246, 240),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        selectedItemColor: AppColors.primary,
        elevation: 0.0,
        type: BottomNavigationBarType.fixed),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: AppColors.primary),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primary,
      padding: AppPading.defaultPadding,
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.primary),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            )))),
    // Define the default font family.
    fontFamily: GoogleFonts.notoKufiArabic().fontFamily,
    textTheme: GoogleFonts.notoKufiArabicTextTheme()
        .apply(displayColor: AppColors.secodary, bodyColor: AppColors.secodary),

    // Define the default `TextTheme`. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    inputDecorationTheme: inputDecorationTheme(),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(18),
    borderSide: const BorderSide(color: Colors.transparent),
    gapPadding: 4,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.never,
    fillColor: AppColors.textFormFill,
    filled: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}
