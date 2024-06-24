import 'package:flutter/material.dart';
import 'package:openknect_form_generator/layout/adaptive_layout_template/utils/responsive_framework_util.dart';
import 'package:responsive_framework/responsive_framework.dart'
    as responsive_framework;

/// A widget that can have the given maximum width [maxWidth].
/// When the screen is wider than the [maxWidth], it creates
/// a gutter area on either side of the content.
class MaxWidthBoxWidget extends StatelessWidget {
  const MaxWidthBoxWidget({
    super.key,
    required this.child,
    this.maxWidth = 2560,
    this.stepSize = 100,
  });
  final Widget child;
  final double maxWidth;
  final int stepSize;

  @override
  Widget build(BuildContext context) {
    // logger.d('${DateFormat.Hms().format(DateTime.now())}: MyMaxWidthBox.build');
    return responsive_framework.MaxWidthBox(
      maxWidth: maxWidth,
      child: responsive_framework.ResponsiveScaledBox(
        width: responsive_framework.ResponsiveValue<double>(
          context,
          conditionalValues: ResponsiveFrameworkUtil.constructConditionalValues(
              startScreenSize: 500, endScreenSize: 2560, stepSize: stepSize),
        ).value,
        child: child,
      ),
    );
  }
}
