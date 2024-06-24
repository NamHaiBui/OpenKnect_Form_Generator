import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openknect_form_generator/layout/adaptive_layout_template/config_builder/default_builder/body_config_builder.dart';
import 'package:openknect_form_generator/layout/adaptive_layout_template/config_builder/default_builder/secondary_body_config_builder.dart';
import 'package:openknect_form_generator/layout/adaptive_layout_template/config_builder/responsive_scaffold_builder/body_config_builder.dart';
import 'package:openknect_form_generator/layout/adaptive_layout_template/config_builder/responsive_scaffold_builder/secondary_body_config_builder.dart';

import 'config_builder/responsive_job_page_builder/body_config_builder.dart';
import 'config_builder/responsive_job_page_builder/secondary_body_config_builder.dart';

abstract class ConfigurationStrategy {
  //*Body
  Map<Breakpoint, SlotLayoutConfig?> buildBodySlotLayoutConfig(
      Map<Breakpoint, Widget> widgets);
  //*SecondaryBody
  Map<Breakpoint, SlotLayoutConfig?> buildSecondaryBodySlotLayoutConfig(
      Map<Breakpoint, Widget> widgets);

  //*PrimaryNavBar
  // Map<Breakpoint, SlotLayoutConfig?> buildPrimaryNavBarConfig(
  //     BuildContext context,
  //     Map<Breakpoint, Widget>? leadingWidgets,
  //     Map<Breakpoint, List<NavigationDestination>>? destinations,
  //     Map<Breakpoint, Widget>? trailingWidgets,
  //     NavigationRailThemeData? navRailTheme,
  //     int? selectedNavigation);
  //*BottomNavBar
  // Map<Breakpoint, SlotLayoutConfig?> buildBottomNavBarConfig(
  //   Map<Breakpoint, List<NavigationDestination>>? bottomNavigationDestinations,
  //   BuildContext context,
  //   int? selectedNavigation,
  //   NavigationRailThemeData? navRailTheme,
  // );
  //*TopNavBar
  // Map<Breakpoint, SlotLayoutConfig?> buildTopNavBarConfig(
  //   Map<Breakpoint, List<NavigationDestination>>? topNavigationDestinations,
  //   BuildContext context,
  //   int? selectedNavigation,
  //   NavigationRailThemeData? navRailTheme,
  // );
}

//*Default Configuration Strategy
class DefaultConfigurationStrategy implements ConfigurationStrategy {
  @override
  Map<Breakpoint, SlotLayoutConfig?> buildBodySlotLayoutConfig(
      Map<Breakpoint, Widget> widgets) {
    return defaultBuildSlotLayoutConfigBody(widgets);
  }

  @override
  Map<Breakpoint, SlotLayoutConfig?> buildSecondaryBodySlotLayoutConfig(
      Map<Breakpoint, Widget> widgets) {
    return defaultBuildSlotLayoutConfigSecondaryBody(widgets);
  }
}

//*Responsive Configuration Strategy
class ResponsiveConfigurationStrategy implements ConfigurationStrategy {
  @override
  Map<Breakpoint, SlotLayoutConfig?> buildBodySlotLayoutConfig(
      Map<Breakpoint, Widget> widgets) {
    return responsiveBuildSlotLayoutConfigBody(widgets);
  }

  @override
  Map<Breakpoint, SlotLayoutConfig?> buildSecondaryBodySlotLayoutConfig(
      Map<Breakpoint, Widget> widgets) {
    return responsiveBuildSlotLayoutConfigSecondaryBody(widgets);
  }
}

//*Responsive Jobs Page Configuration Strategy
class ResponsiveJobsPageConfigurationStrategy implements ConfigurationStrategy {
  @override
  Map<Breakpoint, SlotLayoutConfig?> buildBodySlotLayoutConfig(
      Map<Breakpoint, Widget> widgets) {
    return responsiveJobsPageBuildSlotLayoutConfigBody(widgets);
  }

  @override
  Map<Breakpoint, SlotLayoutConfig?> buildSecondaryBodySlotLayoutConfig(
      Map<Breakpoint, Widget> widgets) {
    return responsiveJobsPageBuildSlotLayoutConfigSecondaryBody(widgets);
  }
}

//*Configuration Context
class ConfigurationContext {
  ConfigurationStrategy strategy;

  ConfigurationContext(this.strategy);

  Map<Breakpoint, SlotLayoutConfig?> buildBodyConfiguration(
      Map<Breakpoint, Widget> widgets) {
    return strategy.buildBodySlotLayoutConfig(widgets);
  }

  Map<Breakpoint, SlotLayoutConfig?> buildSecondaryBodyConfiguration(
      Map<Breakpoint, Widget> widgets) {
    return strategy.buildSecondaryBodySlotLayoutConfig(widgets);
  }

  // Map<Breakpoint, SlotLayoutConfig?> buildPrimaryNavBarConfiguration(
  //     BuildContext context,
  //     Map<Breakpoint, Widget>? leadingWidgets,
  //     Map<Breakpoint, List<NavigationDestination>>? destinations,
  //     Map<Breakpoint, Widget>? trailingWidgets,
  //     NavigationRailThemeData? navRailTheme,
  //     int? selectedNavigation) {
  //   return strategy.buildPrimaryNavBarConfig(context, leadingWidgets,
  //       destinations, trailingWidgets, navRailTheme, selectedNavigation);
  // }

  // Map<Breakpoint, SlotLayoutConfig?> buildTopNavBarConfiguration(
  //   Map<Breakpoint, List<NavigationDestination>>? topNavigationDestinations,
  //   BuildContext context,
  //   int? selectedNavigation,
  //   NavigationRailThemeData? navRailTheme,
  // ) {
  //   return strategy.buildTopNavBarConfig(
  //       topNavigationDestinations, context, selectedNavigation, navRailTheme);
  // }

  // Map<Breakpoint, SlotLayoutConfig?> buildBottomNavBarConfiguration(
  //   Map<Breakpoint, List<NavigationDestination>>? topNavigationDestinations,
  //   BuildContext context,
  //   int? selectedNavigation,
  //   NavigationRailThemeData? navRailTheme,
  // ) {
  //   return strategy.buildBottomNavBarConfig(
  //       topNavigationDestinations, context, selectedNavigation, navRailTheme);
  // }
}

mixin Configurable on ConsumerStatefulWidget {
  late ConfigurationStrategy? configurationStrategy;
  ConfigurationContext get configurationContext => ConfigurationContext(
      configurationStrategy ?? DefaultConfigurationStrategy());
}
