import 'dart:math' as math;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/widgets.dart';

class OpenKnectIconWidget extends StatelessWidget {
  final String iconPath;
  final double width;
  final double height;
  final double rotationDegrees;
  final ColorFilter? color;
  final Color? iconColor;

  const OpenKnectIconWidget(
      {super.key,
      required this.iconPath,
      this.width = 24,
      this.height = 24,
      this.rotationDegrees = 0,
      this.color,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    final rotationRadians = (rotationDegrees / 180) * math.pi;
    return Transform.rotate(
      angle: rotationRadians,
      child: SvgPicture.asset(
        iconPath,
        width: width,
        height: height,
        colorFilter: iconColor != null
            ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
            : color,
      ),
    );
  }
}
