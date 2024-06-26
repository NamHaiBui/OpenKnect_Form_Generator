import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter/material.dart';

//function This function takes a map of Breakpoints to Widgets and returns a map of Breakpoint to SlotLayoutConfig
//function For SecondaryBody
Map<Breakpoint, SlotLayoutConfig?> defaultBuildSlotLayoutConfigSecondaryBody(
  Map<Breakpoint, Widget> widgets,
) {
  Map<Breakpoint, SlotLayoutConfig> slotLayoutConfig = {};

  for (MapEntry<Breakpoint, Widget> entry in widgets.entries) {
    // For each entry, create a SlotLayoutConfig with the widget as the builder
    slotLayoutConfig[entry.key] = SlotLayout.from(
      inAnimation: AdaptiveScaffold.fadeIn,
      outAnimation: AdaptiveScaffold.fadeOut,
      key: ValueKey(
          entry.key.toString()), // Give a unique key based on the Breakpoint
      builder: (_) =>
          entry.value, // Use the Widget for this Breakpoint as the builder
    );
  }
  return slotLayoutConfig;
}
