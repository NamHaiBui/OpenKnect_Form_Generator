import 'package:flutter/material.dart';
import 'package:json/json.dart';

@JsonCodable()
class BasicJSONTS {
  final String color;
  final int fontSize;
  final String fontWeight;

  const BasicJSONTS({
    required this.color,
    required this.fontSize,
    required this.fontWeight,
  });

  TextStyle toTextStyle() {
    return TextStyle(
      color: Color(int.parse(color.replaceAll('#', '0xFF'))),
      fontSize: fontSize.toDouble(),
      fontWeight: _parseFontWeight(fontWeight),
    );
  }

  static FontWeight _parseFontWeight(String fontWeightString) {
    switch (fontWeightString) {
      case "w100":
        return FontWeight.w100;
      case "w200":
        return FontWeight.w200;
      case "w300":
        return FontWeight.w300;
      case "w400":
        return FontWeight.w400; // Normal (default)
      case "w500":
        return FontWeight.w500;
      case "w600":
        return FontWeight.w600;
      case "w700":
        return FontWeight.w700; // Bold
      case "w800":
        return FontWeight.w800;
      case "w900":
        return FontWeight.w900;
      default:
        return FontWeight.normal; // Fallback to normal if not recognized
    }
  }
}
