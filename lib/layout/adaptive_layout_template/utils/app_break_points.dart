import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart'
    as adaptive_scaffold;

import 'package:responsive_framework/responsive_framework.dart'
    as responsive_framework;

/// The application's breakpoints following Material Design 3
/// https://m3.material.io/foundations/layout/applying-layout/window-size-classes
/// It contains breakpoint data type defined in flutter_adaptive_scaffold
/// and in responsive_framework.
/// Note:
/// - flutter_adaptive_scaffold: breakpoints are mutually exclusive numbers,
/// for example: 0 -> 600, 601 -> 840, 841 -> infinity
enum AppBreakpoint {
  compact(
    // Small screen defined in adaptive_scaffold package. It is equivalent to
    // WidthPlatformBreakpoint(begin: 0, end: 600),
    // In Material Design 3, it is called COMPACT
    adaptive: adaptive_scaffold.Breakpoints.small,
    responsive:
        responsive_framework.Breakpoint(start: 0, end: 600, name: 'COMPACT'),
  ),

  medium(
    // Medium screen defined in adaptive_scaffold package. It is equivalent to
    // WidthPlatformBreakpoint(begin: 600, end: 840),
    // In Material Design 3, it is called MEDIUM
    adaptive: adaptive_scaffold.Breakpoints.medium,
    responsive:
        responsive_framework.Breakpoint(start: 601, end: 840, name: 'MEDIUM'),
  ),

  expanded(
    // Large screen defined in adaptive_scaffold package. It is equivalent to
    // WidthPlatformBreakpoint(begin: 840),
    // In Material Design 3, it is called EXPANDED
    adaptive: adaptive_scaffold.Breakpoints.large,
    responsive: responsive_framework.Breakpoint(
        start: 841, end: double.infinity, name: 'EXPANDED'),
  );

  final adaptive_scaffold.Breakpoint adaptive;
  final responsive_framework.Breakpoint responsive;
  const AppBreakpoint({
    required this.adaptive,
    required this.responsive,
  });
}
