import 'package:flutter/material.dart';
import 'color_scheme.dart';

const typography = TextTheme(
  displayLarge: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 56,
    height: 73 / 56,
    fontWeight:
        FontWeight.w600, // you can change this to w700 or w800 as needed
  ),
  displayMedium: TextStyle(
    fontSize: 48,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    height: 52 / 48,
  ),
  displaySmall: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 40,
    height: 52 / 40,
    fontWeight: FontWeight.w600,
  ),
  headlineLarge: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 36,
    height: 47 / 36,
    fontWeight: FontWeight.w600,
  ),
  headlineMedium: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 32,
    height: 42 / 32,
    fontWeight: FontWeight.w600,
  ),
  titleLarge: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24,
    height: 31 / 24,
    fontWeight: FontWeight.w600,
  ),
  titleMedium: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.normal,
    height: 1.5,
  ),
  titleSmall: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 20,
    height: 26 / 20,
    fontWeight: FontWeight.w600,
  ),
  headlineSmall:
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, height: 1.3),
  bodyLarge: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    height: 23 / 18,
    fontWeight: FontWeight.w400,
  ),
  bodyMedium: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    height: 21 / 16,
    fontWeight: FontWeight.w400,
  ),
  bodySmall: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    height: 18 / 14,
    fontWeight: FontWeight.w400,
  ),
  labelLarge: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w400, // Medium
    height: 2.4,
  ),
  labelMedium: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.w400, // Medium
    height: 2.1,
  ),
  labelSmall: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: FontWeight.w400, // Medium
    height: 1.8,
  ),
);


TextStyle inputTitleTextStyle = const TextStyle(
  color: Colors.black,
  fontSize: 14.0,
  fontWeight: FontWeight.normal
);

TextStyle blueBtnTextStyle = const TextStyle(
  color: Colors.white,
  fontSize: 14.0,
  fontWeight: FontWeight.bold
);

TextStyle hintTextStyle = const TextStyle(
  color: hintColor,
  fontSize: 14.0,
  fontWeight: FontWeight.normal
);

TextStyle outlineBtnTextStyle = const TextStyle(
  color: brandBlue,
  fontSize: 14.0,
  fontWeight: FontWeight.bold
);

TextStyle hiddenTextStyle = const TextStyle(
  color: Colors.transparent,
  fontSize: 0.0,
);