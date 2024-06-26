import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openknect_form_generator/frontend/layout/adaptive_layout_template/adaptive_layout_template.dart';
import 'package:openknect_form_generator/frontend/layout/adaptive_layout_template/service/state_management.dart';
import 'package:shared_preferences/shared_preferences.dart';

//function Helper function
bool containsBreakpoint(Map<Breakpoint, dynamic>? map, Breakpoint breakpoint) {
  return map?.containsKey(breakpoint) ?? false;
}

//function Helper function clean URls to prevent my heart <3 attacks
String cleanUrlPath(String? path) {
  if (path == null) {
    return '';
  }

  // Define what characters are considered valid.
  String validCharacters = 'abcdefghijklmnopqrstuvwxyz';

  // Construct a new path string, filtering out any invalid characters
  String newPath = '';
  for (int i = 0; i < path.length; i++) {
    String char = path[i];
    if (validCharacters.contains(char)) {
      newPath += char;
    }
  }

  // Replace the old path with the new, cleaned path
  return newPath;
}

//function This function takes a map of Breakpoints and Widgets and returns a map of Breakpoint to SlotLayoutConfig
//function for primary navigation
Map<Breakpoint, SlotLayoutConfig?> defaultBuildPrimaryNavBarConfig(
    BuildContext context,
    Map<Breakpoint, Widget>? leadingWidgets,
    Map<Breakpoint, List<NavigationDestination>>? destinations,
    Map<Breakpoint, Widget>? trailingWidgets,
    bool? staticRouting,
    NavigationRailThemeData navRailTheme,
    WidgetRef ref) {
  // Map to store the final configuration.
  Map<Breakpoint, SlotLayoutConfig> config = {};
  // Iterate over all breakpoints
  for (Breakpoint breakpoint in breakpoints) {
    // Check if this breakpoint is included in any of the maps.
    // If not, skip this iteration.
    if (!containsBreakpoint(leadingWidgets, breakpoint) &&
        !containsBreakpoint(destinations, breakpoint) &&
        !containsBreakpoint(trailingWidgets, breakpoint)) {
      continue;
    }
    // Build SlotLayoutConfig for this breakpoint
    SlotLayoutConfig slotLayoutConfig = SlotLayout.from(
      //TODO: insert your animations here
      key: Key('Primary Navigation $breakpoint'),
      builder: (_) => AdaptiveScaffold.standardNavigationRail(
        selectedIndex: ref.read(selectedNavigationProvider),
        onDestinationSelected: (int newIndex) async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setInt('selectedNavigation', newIndex);
          ref
              .read(selectedNavigationProvider.notifier)
              .update((state) => newIndex);
          // TODO: update the bodyWidgets
          staticRouting == true
              ? null
              //!!! ignore: use_build_context_synchronously
              // ignore: use_build_context_synchronously
              : context.go(
                  '/feature1/public/${cleanUrlPath(destinations?[breakpoint]?[ref.read(selectedNavigationProvider)].key.toString())}');
        },
        extended: breakpoint == Breakpoints.large ? true : false,
        leading: leadingWidgets?[breakpoint] ??
            const SizedBox.shrink(), // use null if not present in the map
        destinations:
            destinations != null && destinations.containsKey(breakpoint)
                ? destinations[breakpoint]!
                    .map((_) => AdaptiveScaffold.toRailDestination(_))
                    .toList()
                : [], // use an empty list if not present in the map
        trailing: trailingWidgets?[breakpoint] ??
            const SizedBox.shrink(), // use null if not present in the map
        backgroundColor: navRailTheme.backgroundColor,
        selectedIconTheme: navRailTheme.selectedIconTheme,
        unselectedIconTheme: navRailTheme.unselectedIconTheme,
        selectedLabelTextStyle: navRailTheme.selectedLabelTextStyle,
      ),
    );

    // Add this configuration to the final map
    config[breakpoint] = slotLayoutConfig;
  }

  return config;
}
