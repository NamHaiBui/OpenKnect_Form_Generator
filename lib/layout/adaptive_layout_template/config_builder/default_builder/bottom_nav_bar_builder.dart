// import 'package:auth/adaptive_layout_template/adaptive_layout_template.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:openknect_form_generator/layout/adaptive_layout_template/adaptive_layout_template.dart';
// import 'package:openknect_app/features/adaptive_layout_template/adaptive_layout_template.dart';

//function This function takes a map of Breakpoints to Widgets and returns a map of Breakpoint to SlotLayoutConfig
Map<Breakpoint, SlotLayoutConfig?> defaultBuildBottomNavBarConfig(
  Map<Breakpoint, List<NavigationDestination>>? bottomNavigationDestinations,
  BuildContext context,
  int? selectedNavigation,
  NavigationRailThemeData? navRailTheme,
) {
  // Map to store the final configuration.
  Map<Breakpoint, SlotLayoutConfig> config = {};

  // Iterate over all breakpoints
  for (Breakpoint breakpoint in breakpoints) {
    // Check if this breakpoint is included in any of the maps.
    // If not, skip this iteration.
    if (!(bottomNavigationDestinations?.containsKey(breakpoint) ?? false)) {
      continue;
    }
    // Build SlotLayoutConfig for this breakpoint
    SlotLayoutConfig slotLayoutConfig = SlotLayout.from(
      inAnimation: AdaptiveScaffold.leftOutIn,
      outAnimation: AdaptiveScaffold.fadeOut,
      key: Key('Primary Navigation $breakpoint'),
      builder: (_) => AdaptiveScaffold.standardBottomNavigationBar(
        currentIndex: selectedNavigation,
        onDestinationSelected: (int newIndex) {
          // TODO: Add a go_router route for each destination dynamiclly
          context.go('/feature1/job_poster/job_poster_page');
          // setState(() {
          //   selectedNavigation = newIndex;
          //   currentBodyWidgets = widget.bodyWidgets(selectedNavigation);
          // });
        },
        destinations: bottomNavigationDestinations != null &&
                bottomNavigationDestinations.containsKey(breakpoint)
            ? bottomNavigationDestinations[breakpoint]!
            : [], // use an empty list if not present in the map
      ),
    );

    // Add this configuration to the final map
    config[breakpoint] = slotLayoutConfig;
  }

  return config;
}
