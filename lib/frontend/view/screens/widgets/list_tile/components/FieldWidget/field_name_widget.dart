// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:openknect_form_generator/frontend/layout/theme_system/data/color_scheme.dart';
// import 'package:openknect_app/features/theme_system/theme_system.dart';

class FieldNameWidget extends StatelessWidget {
  final String fieldName;
  final double fontSize;
  final FontWeight? fontWeight;

  const FieldNameWidget(
      {super.key,
      required this.fieldName,
      this.fontSize = 12,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      fieldName,
      style:
          TextStyle(color: onCards, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
