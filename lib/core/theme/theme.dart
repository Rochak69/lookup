import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookup/res/colors.dart';

ThemeData mAppTheme() => ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      fontFamily: 'Raleway',
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black, size: 5),
        toolbarTextStyle: TextStyle(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black),
      ),
      textTheme: GoogleFonts.ralewayTextTheme(),
      primaryTextTheme: const TextTheme()
          .apply(displayColor: AppColors.white, bodyColor: AppColors.white),
      scaffoldBackgroundColor: AppColors.primary,
    );
