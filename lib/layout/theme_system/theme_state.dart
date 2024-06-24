import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme_data.dart'; // Import your theme data

class ThemeState extends StateNotifier<ThemeMode> {
  ThemeState() : super(ThemeMode.light);

  ThemeData get currentThemeData =>
      state == ThemeMode.light ? lightTheme : darkTheme;

  IconData get themeModeIcon {
    switch (state) {
      case ThemeMode.light:
        return Icons.brightness_low;
      case ThemeMode.dark:
        return Icons.brightness_3;
      default:
        return Icons.brightness_auto;
    }
  }

  void toggleThemeMode() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}

final themeProvider =
    StateNotifierProvider<ThemeState, ThemeMode>((ref) => ThemeState());
