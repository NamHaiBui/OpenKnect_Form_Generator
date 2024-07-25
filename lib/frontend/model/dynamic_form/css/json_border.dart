import 'package:flutter/material.dart';
import 'package:json/json.dart';

@JsonCodable()
class JSONBorder {
  final String left;
  final String right;
  final String top;
  final String bottom;
  final int borderRadius;
  const JSONBorder({
    this.borderRadius = 0,
    this.left = "1px solid 0xFF000000",
    this.right = "1px solid 0xFF000000",
    this.top = "1px solid 0xFF000000",
    this.bottom = "1px solid 0xFF000000",
  });

  Border parseBorder() {
    return Border(
      left: _parseBorderSide(left),
      right: _parseBorderSide(right),
      top: _parseBorderSide(top),
      bottom: _parseBorderSide(bottom),
    );
  }

  OutlineInputBorder parseInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius.toDouble()),
      borderSide: _parseBorderSide(left),
    );
  }

  BorderSide _parseBorderSide(String borderSideString) {
    final parts = borderSideString.split(" ");
    if (parts.length != 3) {
      throw ArgumentError("Invalid border side format: $borderSideString");
    }

    final width = double.parse(parts[0].replaceAll("px", ""));
    final style = _parseBorderStyle(parts[1]);
    final color = Color(int.parse(parts[2].replaceAll("#", "0xFF")));

    return BorderSide(width: width, style: style, color: color);
  }

  BorderStyle _parseBorderStyle(String styleString) {
    switch (styleString) {
      case "solid":
        return BorderStyle.solid;
      case "none":
        return BorderStyle.none;
      // Add more cases for other border styles if needed
      default:
        throw ArgumentError("Unsupported border style: $styleString");
    }
  }
}
