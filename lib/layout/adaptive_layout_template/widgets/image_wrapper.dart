import 'package:flutter/material.dart';
import 'package:openknect_form_generator/layout/adaptive_layout_template/utils/responsive_utility.dart';

/// Wrap image in a Container with given [aspectRatio]
// Add your actual path to the ResponsiveUtility file

class ImageWrapper extends StatelessWidget {
  final String imageUrl;
  final double minAspectRatio;
  final double maxAspectRatio;
  final double minHorizontalSize; // Min horizontal margin
  final double maxHorizontalSize; // Max horizontal margin
  final double minVerticalSize; // Min vertical margin
  final double maxVerticalSize; // Max vertical margin

  const ImageWrapper({
    super.key,
    required this.imageUrl,
    this.minAspectRatio = 16 / 9, // default min aspect ratio
    this.maxAspectRatio = 21 / 9, // default max aspect ratio
    this.minHorizontalSize = 10,
    this.maxHorizontalSize = 20,
    this.minVerticalSize = 15,
    this.maxVerticalSize = 30,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double aspectRatio = ResponsiveUtility.getResponsiveAspectRatio(
      screenWidth: screenWidth,
      minAspectRatio: minAspectRatio,
      maxAspectRatio: maxAspectRatio,
    );

    final EdgeInsets margin = ResponsiveUtility.getResponsiveSymmetricPadding(
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      minHorizontalSize: minHorizontalSize, // Min horizontal margin
      maxHorizontalSize: maxHorizontalSize, // Max horizontal margin
      minVerticalSize: minVerticalSize, // Min vertical margin
      maxVerticalSize: maxVerticalSize, // Max vertical margin
    );

    return Container(
      margin: margin,
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(1),
          child: Image(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
