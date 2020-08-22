import 'package:flutter/material.dart';

Map<int, Color> colorCodes = {
  50: Color.fromRGBO(147, 205, 72, .1),
  100: Color.fromRGBO(147, 205, 72, .2),
  200: Color.fromRGBO(147, 205, 72, .3),
  300: Color.fromRGBO(147, 205, 72, .4),
  400: Color.fromRGBO(147, 205, 72, .5),
  500: Color.fromRGBO(147, 205, 72, .6),
  600: Color.fromRGBO(147, 205, 72, .7),
  700: Color.fromRGBO(147, 205, 72, .8),
  800: Color.fromRGBO(147, 205, 72, .9),
  900: Color.fromRGBO(147, 205, 72, 1),
};

class AppColors {
  static const Color offWhite = const Color(0xFFd8f3dc);
  static const Color green_ming = const Color(0xFF2C6975);
  static const Color green_sheen = const Color(0xFF68B2A0);
  static const Color green_nyanza = const Color(0xFFCDE0C9);
  static const Color green_honeydraw = const Color(0xFFE0ECDE);
}

class AppTextStyles {
  static const TextStyle bodyText = const TextStyle(
    color: AppColors.green_ming,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.5,
  );
  static const TextStyle body2Text = const TextStyle(
    color: AppColors.green_ming,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.5,
  );

  static const TextStyle heading1White = const TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.5,
  );

  static const TextStyle headline2White = const TextStyle(
    color: AppColors.offWhite,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
  );

  static const TextStyle headline3White = const TextStyle(
    color: AppColors.offWhite,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
  );
}
