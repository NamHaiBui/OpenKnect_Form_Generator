import 'package:flutter/material.dart';
import 'package:openknect_form_generator/frontend/layout/adaptive_layout_template/adaptive_layout_template.dart';

abstract class AdaptiveConfigurationStrategy {
  Widget getBody(int index, Breakpoint breakpoint);
}

class StaticConfigurationStrategy implements AdaptiveConfigurationStrategy {
  final Map<int, Map<Breakpoint, Widget>> bodies;

  StaticConfigurationStrategy(this.bodies);

  @override
  Widget getBody(int index, Breakpoint breakpoint) {
    if (bodies[index] == null || bodies[index]?[breakpoint] == null) {
      // You can return an empty widget or a placeholder widget if the configuration isn't found
      return Container();
    }

    return bodies[index]![breakpoint]!;
  }
}

// ignore: must_be_immutable
abstract class CustomAdaptiveLayoutTemplate extends AdaptiveLayoutTemplate {
  final AdaptiveConfigurationStrategy adaptiveConfigurationStrategy;

  CustomAdaptiveLayoutTemplate({
    super.key,
    required this.adaptiveConfigurationStrategy,
    // required this.configurationStrategy,
    required super.bodyWidgets,
    super.mainNavigationTrailingNavBarWidgets,
    super.mainNavigationLeadingWidgets,
    super.mainNavigationDestinations,
    super.bottomNavigationWidgets,
    super.topNavigationWidgets,
    super.secondBodyWidgets,
    super.staticRouting = null,
    // Other parameters
  });

  @override
  Widget getBody(int index, Breakpoint breakpoint) {
    return adaptiveConfigurationStrategy.getBody(index, breakpoint);
  }
}
