import 'package:flutter/material.dart';
import 'color_scheme.dart';

// Margin
const EdgeInsets marginBottom12 = EdgeInsets.only(bottom: 12);
const EdgeInsets marginBottom20 = EdgeInsets.only(bottom: 20);
const EdgeInsets marginBottom24 = EdgeInsets.only(bottom: 24);
const EdgeInsets marginBottom40 = EdgeInsets.only(bottom: 40);

// Padding
const EdgeInsets padding0 = EdgeInsets.all(0);
const EdgeInsets padding3 = EdgeInsets.all(3);
const EdgeInsets padding4 = EdgeInsets.all(4);
const EdgeInsets padding6 = EdgeInsets.all(6);
const EdgeInsets padding8 = EdgeInsets.all(8);
const EdgeInsets padding10 = EdgeInsets.all(10);
const EdgeInsets padding12 = EdgeInsets.all(12);
const EdgeInsets padding16 = EdgeInsets.all(16);
const EdgeInsets padding20 = EdgeInsets.all(20);
const EdgeInsets padding24 = EdgeInsets.all(24);
const EdgeInsets padding64 = EdgeInsets.all(64);
const EdgeInsets padding16x12 =
    EdgeInsets.symmetric(horizontal: 16, vertical: 12);
const EdgeInsets padding8x24 =
    EdgeInsets.symmetric(horizontal: 8, vertical: 24);
const EdgeInsets padding24x8 =
    EdgeInsets.symmetric(horizontal: 24, vertical: 8);
const EdgeInsets padding24x12 =
    EdgeInsets.symmetric(horizontal: 24, vertical: 12);
const EdgeInsets padding24x16 =
    EdgeInsets.symmetric(horizontal: 24, vertical: 16);
const EdgeInsets padding24x20 =
    EdgeInsets.symmetric(horizontal: 24, vertical: 20);
const EdgeInsets padding36x32 =
    EdgeInsets.symmetric(horizontal: 36, vertical: 32);
const EdgeInsets padding40x16 =
    EdgeInsets.symmetric(horizontal: 40, vertical: 16);
const EdgeInsets padding28x24 =
    EdgeInsets.symmetric(horizontal: 28, vertical: 24);
const EdgeInsets padding32x16 =
    EdgeInsets.symmetric(horizontal: 32, vertical: 16);
const EdgeInsets padding32x24 =
    EdgeInsets.symmetric(horizontal: 32, vertical: 24);
const EdgeInsets padding52x20 =
    EdgeInsets.symmetric(horizontal: 52, vertical: 20);
const EdgeInsets padding64x24 =
    EdgeInsets.symmetric(horizontal: 64, vertical: 24);
const EdgeInsets paddingVertical8 = EdgeInsets.symmetric(vertical: 8);
const EdgeInsets paddingVertical12 = EdgeInsets.symmetric(vertical: 12);
const EdgeInsets paddingVertical16 = EdgeInsets.symmetric(vertical: 16);
const EdgeInsets paddingVertical20 = EdgeInsets.symmetric(vertical: 20);
const EdgeInsets paddingVertical24 = EdgeInsets.symmetric(vertical: 24);
const EdgeInsets paddingVertical32 = EdgeInsets.symmetric(vertical: 32);
const EdgeInsets paddingHorizontal6 = EdgeInsets.symmetric(horizontal: 6);
const EdgeInsets paddingHorizontal8 = EdgeInsets.symmetric(horizontal: 8);
const EdgeInsets paddingHorizontal16 = EdgeInsets.symmetric(horizontal: 16);
const EdgeInsets paddingHorizontal24 = EdgeInsets.symmetric(horizontal: 24);
const EdgeInsets paddingBottom24 = EdgeInsets.only(bottom: 24);
const EdgeInsets paddingLeft10 = EdgeInsets.only(left: 10);
const EdgeInsets paddingLeft12 = EdgeInsets.only(left: 12);
const EdgeInsets paddingLeft16 = EdgeInsets.only(left: 16);
const EdgeInsets paddingLeft24 = EdgeInsets.only(left: 24);
const EdgeInsets paddingRight16 = EdgeInsets.only(right: 16);
const EdgeInsets paddingTop32 = EdgeInsets.only(top: 32);
const EdgeInsets paddingTop12 = EdgeInsets.only(top: 12);
const EdgeInsets paddingLeft16Right88 = EdgeInsets.only(left: 16, right: 88);
const EdgeInsets paddingLeft48Right88 = EdgeInsets.only(left: 48, right: 88);
const EdgeInsets paddingLeft16Top12 = EdgeInsets.only(left: 16, top: 12);
const EdgeInsets paddingLeft16Top32 = EdgeInsets.only(left: 16, top: 32);
const EdgeInsets paddingLeft16Top16 = EdgeInsets.only(left: 16, top: 16);
const EdgeInsets paddingLeft16Bottom24 = EdgeInsets.only(left: 16, bottom: 24);
const EdgeInsets paddingStepper =
    EdgeInsets.only(left: 32, right: 32 + 56, bottom: 32, top: 24);
const EdgeInsets paddingBottomNavApplication =
    EdgeInsets.only(left: 16, right: 56, bottom: 16, top: 16);
    
//border radius
final BorderRadius borderRadius5 = BorderRadius.circular(5);
final BorderRadius borderRadius10 = BorderRadius.circular(10);
final BorderRadius borderRadius35 = BorderRadius.circular(35);

//Input style
const EdgeInsets inputPadding = EdgeInsets.only(top: 18, left: 10, right: 10);
const EdgeInsets radioInputPadding = EdgeInsets.only(top: 30, left: 10, right: 10);
final OutlineInputBorder border = OutlineInputBorder(
    borderSide: const BorderSide(width: 1, color: divider),
    borderRadius: BorderRadius.circular(10));
final OutlineInputBorder enabledBorder = OutlineInputBorder(
    borderSide: const BorderSide(width: 1, color: divider),
    borderRadius: BorderRadius.circular(10));
final OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderSide: const BorderSide(width: 1, color: brandBlue),
    borderRadius: BorderRadius.circular(10));
final OutlineInputBorder errorBorder = OutlineInputBorder(
    borderSide: const BorderSide(width: 1, color: errorField),
    borderRadius: BorderRadius.circular(10));

const OutlineInputBorder borderNoRadius = OutlineInputBorder(
    borderSide: BorderSide(width: 1, color: divider));
const OutlineInputBorder enabledBorderNoRadius = OutlineInputBorder(
    borderSide: BorderSide(width: 1, color: divider));
const OutlineInputBorder focusedBorderNoRadius = OutlineInputBorder(
    borderSide: BorderSide(width: 1, color: brandBlue));
const OutlineInputBorder errorBorderNoRadius = OutlineInputBorder(
    borderSide: BorderSide(width: 1, color: errorField));

List<BoxShadow>? boxShadow = const [
  BoxShadow(
    offset: Offset(0, 1.5764514207839966),
    blurRadius: 4.729354381561279,
    color: Color.fromRGBO(0, 0, 0, 0.15),
  ),
  BoxShadow(
    offset: Offset(0, 0.7882257103919983),
    blurRadius: 1.5764514207839966,
    color: Color.fromRGBO(0, 0, 0, 0.30),
  ),
];
