import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter/material.dart';

//function This function takes a map of Breakpoints to Widgets and returns a map of Breakpoint to SlotLayoutConfig
//function For Body
Map<Breakpoint, SlotLayoutConfig?> defaultBuildSlotLayoutConfigBody(
    Map<Breakpoint, Widget> widgets) {
  Map<Breakpoint, SlotLayoutConfig> slotLayoutConfig = {};

  for (MapEntry<Breakpoint, Widget> entry in widgets.entries) {
    // For each entry, create a SlotLayoutConfig with the widget as the builder
    slotLayoutConfig[entry.key] = SlotLayout.from(
      inAnimation: AdaptiveScaffold.fadeIn,
      outAnimation: AdaptiveScaffold.fadeOut,
      key: ValueKey(
          entry.key.toString()), // Give a unique key based on the Breakpoint
      builder: (_) => Container(
          decoration: const BoxDecoration(
              border: Border(
            // top: BorderSide(width: 1, color: Color(r0xFFDDE5E9)),
            left: BorderSide(width: 1, color: Color(0xFFDDE5E9)),
          )),
          child:
              entry.value), // Use the Widget for this Breakpoint as the builder
    );
  }
  return slotLayoutConfig;
}
