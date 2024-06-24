import 'package:flutter/material.dart';

// Assuming you have these defined in your project
Color primaryColor =
    const Color(0xFF0F52BA); // Replace with actual primary color
Color textColor = const Color(0xFF344054); // Replace with actual text color
TextStyle bodyLarge = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal); // Adjust based on your project

// Button styles
ButtonStyle enabledButtonStyle = ButtonStyle(
  elevation: WidgetStateProperty.all(0.0),
  textStyle: WidgetStateProperty.all(TextStyle(
    color: primaryColor,
    fontSize: bodyLarge.fontSize,
    fontWeight: bodyLarge.fontWeight,
  )),
  foregroundColor: WidgetStateProperty.all(primaryColor),
);
// Button styles
ButtonStyle memeButtonStyle = ButtonStyle(
  elevation: WidgetStateProperty.all(0.0),
  textStyle: WidgetStateProperty.all(TextStyle(
    color: primaryColor,
    fontSize: bodyLarge.fontSize,
    fontWeight: bodyLarge.fontWeight,
  )),
  foregroundColor: WidgetStateProperty.all(primaryColor),
  backgroundColor: WidgetStateProperty.all(Colors.red),
);

ButtonStyle disabledButtonStyle = ButtonStyle(
  textStyle: WidgetStateProperty.all(TextStyle(
    color: textColor,
    fontSize: bodyLarge.fontSize,
    fontWeight: bodyLarge.fontWeight,
  )),
  foregroundColor: WidgetStateProperty.all(textColor.withOpacity(0.5)),
);

ButtonStyle hoveredButtonStyle = ButtonStyle(
    textStyle: WidgetStateProperty.all(TextStyle(
      color: primaryColor,
      fontSize: bodyLarge.fontSize,
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.underline,
    )),
    foregroundColor: WidgetStateProperty.all(primaryColor),
    overlayColor:
        WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.hovered)) {
        return primaryColor.withOpacity(0.08);
      }
      return primaryColor; // Defer to the widget's default.
    }));

ButtonStyle focusedButtonStyle = ButtonStyle(
  textStyle: WidgetStateProperty.all(TextStyle(
    color: primaryColor,
    fontSize: bodyLarge.fontSize,
    fontWeight: FontWeight.w800,
  )),
  foregroundColor: WidgetStateProperty.all(primaryColor),
);
