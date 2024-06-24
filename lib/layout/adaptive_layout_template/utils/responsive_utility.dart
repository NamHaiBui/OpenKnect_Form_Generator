import 'package:flutter/material.dart';

class ResponsiveUtility {
  // This function will give you responsive font size
  static double getResponsiveFontSize(
      double screenWidth, double minFontSize, double maxFontSize) {
    double fontSize = minFontSize +
        (maxFontSize - minFontSize) * ((screenWidth - 320) / (1440 - 320));
    fontSize = fontSize.clamp(minFontSize, maxFontSize);
    return fontSize;
  }

  // This function will give you responsive width
  static double getResponsiveWidth(
      double screenWidth, double minSize, double maxSize) {
    double size =
        minSize + (maxSize - minSize) * ((screenWidth - 320) / (1440 - 320));
    size = size.clamp(minSize, maxSize);
    return size;
  }

  // This function will give you responsive height
  static double getResponsiveHeight(
      double screenHeight, double minSize, double maxSize) {
    double size =
        minSize + (maxSize - minSize) * ((screenHeight - 568) / (2960 - 568));
    size = size.clamp(minSize, maxSize);
    return size;
  }

  // For responsive padding and margin
  static EdgeInsets getResponsivePadding(
      double screenWidth, double minSize, double maxSize) {
    double size =
        minSize + (maxSize - minSize) * ((screenWidth - 320) / (1440 - 320));
    size = size.clamp(minSize, maxSize);
    return EdgeInsets.all(size);
  }

  // For responsive border radius
  static BorderRadius getResponsiveBorderRadius(
      double screenWidth, double minSize, double maxSize) {
    double size =
        minSize + (maxSize - minSize) * ((screenWidth - 320) / (1440 - 320));
    size = size.clamp(minSize, maxSize);
    return BorderRadius.circular(size);
  }

  // For responsive icon size
  static double getResponsiveIconSize(
      double screenWidth, double minSize, double maxSize) {
    double size =
        minSize + (maxSize - minSize) * ((screenWidth - 320) / (1440 - 320));
    size = size.clamp(minSize, maxSize);
    return size;
  }

  // For responsive aspect ratio
  static double getResponsiveAspectRatio({
    required double screenWidth,
    required double minAspectRatio,
    required double maxAspectRatio,
  }) {
    double aspectRatio = minAspectRatio +
        (maxAspectRatio - minAspectRatio) *
            ((screenWidth - 320) / (1440 - 320));
    aspectRatio = aspectRatio.clamp(minAspectRatio, maxAspectRatio);

    return aspectRatio;
  }

  // For responsive padding
  static EdgeInsets getResponsiveSymmetricPadding({
    required double screenWidth,
    required double screenHeight,
    required double minHorizontalSize,
    required double maxHorizontalSize,
    required double minVerticalSize,
    required double maxVerticalSize,
  }) {
    double horizontalSize = minHorizontalSize +
        (maxHorizontalSize - minHorizontalSize) *
            ((screenWidth - 320) / (1440 - 320));
    horizontalSize = horizontalSize.clamp(minHorizontalSize, maxHorizontalSize);

    double verticalSize = minVerticalSize +
        (maxVerticalSize - minVerticalSize) *
            ((screenHeight - 320) / (1440 - 320));
    verticalSize = verticalSize.clamp(minVerticalSize, maxVerticalSize);

    return EdgeInsets.symmetric(
        horizontal: horizontalSize, vertical: verticalSize);
  }
}
