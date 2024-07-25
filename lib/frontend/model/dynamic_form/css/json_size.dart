import 'package:flutter/material.dart';
import 'package:json/json.dart';

@JsonCodable()
class JSONSize {
  final int width;
  final int height;

  const JSONSize({
    required this.width,
    required this.height,
  });

  Size toSize() {
    return Size(width.toDouble(), height.toDouble());
  }
}
