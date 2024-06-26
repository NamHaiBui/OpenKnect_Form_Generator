// import 'package:auth/adaptive_layout_template/widgets/max_width_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:openknect_form_generator/frontend/layout/adaptive_layout_template/widgets/max_width_box_widget.dart';
// // import 'package:openknect_app/features/adaptive_layout_template/widgets/max_width_box_widget.dart';

Map<Breakpoint, SlotLayoutConfig?> responsiveBuildSlotLayoutConfigBody(
    Map<Breakpoint, Widget> widgets) {
  Map<Breakpoint, SlotLayoutConfig> slotLayoutConfig = {};

  for (MapEntry<Breakpoint, Widget> entry in widgets.entries) {
    slotLayoutConfig[entry.key] = SlotLayout.from(
        inAnimation: AdaptiveScaffold.fadeIn,
        outAnimation: AdaptiveScaffold.fadeOut,
        key: ValueKey(entry.key.toString()),
        builder: (context) => MaxWidthBoxWidget(
              stepSize: 50,
              child: entry.value,
            ));
  }
  return slotLayoutConfig;
}
