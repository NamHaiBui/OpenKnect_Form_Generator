import 'package:flutter/material.dart';

import 'data/color_scheme.dart';
import 'data/text_data.dart';

// Create custom theme color from seed
// ref: https://github.com/material-foundation/flutter-packages/blob/main/packages/dynamic_color/example/lib/complete_example.dart

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  textTheme: typography,
  fontFamily: 'Roboto',
  fontFamilyFallback: const ['Poppins', 'Lato', 'Times New Roman'],
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(color: Color.fromARGB(31, 20, 19, 19)),
  ),
  colorScheme: lightColorScheme,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  textTheme: typography,
  fontFamily: 'Roboto',
  fontFamilyFallback: const ['Poppins', 'Lato', 'Times New Roman'],
  appBarTheme: const AppBarTheme(
    color: Colors.black12,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  colorScheme: darkColorScheme.copyWith(brightness: Brightness.dark),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
