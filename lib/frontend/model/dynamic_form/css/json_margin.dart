import 'package:flutter/painting.dart';
import 'package:json/json.dart';

@JsonCodable()
class JSONMargin {
  final int left;
  final int right;
  final int top;
  final int bottom;

  const JSONMargin({
    required this.left,
    required this.right,
    required this.top,
    required this.bottom,
  });

  EdgeInsetsGeometry toEdgeInsets() {
    return EdgeInsets.fromLTRB(
      left.toDouble(),
      top.toDouble(),
      right.toDouble(),
      bottom.toDouble(),
    );
  }
}
