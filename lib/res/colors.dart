import 'package:flutter/material.dart';

class AppColors {
  static const Color white = Colors.white;
  static const Color textGrey = Color(0xff6E6B6B);
  static const Color splashGreyBackground = Color(0xffD9D9D9);
  static const Color textfieldHintGrey = Color(0xffC3BFBF);
  static const Color homeTextGrey = Color(0xffA6A3A3);
  static const Color buttonShadow = Color.fromRGBO(0, 0, 0, 0.25);
  static const Color black = Color(0xff000000);
  static const Color yellow = Colors.yellow;

  static MaterialColor gray = const MaterialColor(
    0xff475467,
    {
      25: Color(0xffFCFCFD),
      50: Color(0xffF9FAFB),
      100: Color(0xffF2F4F7),
      200: Color(0xffEAECF0),
      300: Color(0xffD0D5DD),
      400: Color(0xff98A2B3),
      500: Color(0xff667085),
      600: Color(0xff475467),
      700: Color(0xff344054),
      800: Color(0xff1D2939),
      900: Color(0xff101828),
    },
  );
  static MaterialColor error = const MaterialColor(
    0xffF04438,
    {
      50: Color(0xffFEF3F2),
      300: Color(0xfffda29b),
      400: Color(0xfff97066),
      500: Color(0xffF04438),
    },
  );

  static MaterialColor warning = const MaterialColor(
    0xffF04438,
    {
      300: Color(0xfffec84b),
      500: Color(0xffF79009),
    },
  );

  static const MaterialColor primary = MaterialColor(
    0xFF1D67DD,
    {},
  );
}
