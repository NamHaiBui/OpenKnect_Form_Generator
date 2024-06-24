import 'package:responsive_framework/responsive_framework.dart'
    as responsive_framework;

/// The util class with convenient methods to work with the
/// responsive_framework package.
class ResponsiveFrameworkUtil {
  /// Create a list of Condition values
  /// from smallest screen size [startScreenSize]
  /// to the largetst screen size [endScreenSize]
  /// with the step size of [stepSize].
  /// - for each screen size between [x, x + stepSize], the condition value is x
  /// To make the scaling transition go smoothly, the stepSize should not be
  /// too large. Play around different number to ensure performance is not
  /// compromised.
  /// The values here can be independent from the main's application [MaterialApp].
  /// For example, in the [MaterialApp], there are 3 defined breakpoints
  /// [AppBreakpoint.compact], [AppBreakpoint.medium], [AppBreakpoint.expanded],
  /// it is not necessary to just create the 3 Condition values as below:
  /// responsive_framework.Condition.equals(
  ///     name: AppBreakpoint.compact.responsive.name, value: 350),
  /// responsive_framework.Condition.equals(
  ///     name: AppBreakpoint.medium.responsive.name, value: 600),
  /// responsive_framework.Condition.equals(
  ///     name: AppBreakpoint.expanded.responsive.name, value: 840),
  static List<responsive_framework.Condition<double>>
      constructConditionalValues({
    required int startScreenSize,
    required int endScreenSize,
    required int stepSize,
  }) {
    final myRange = [
      for (int i = startScreenSize; i <= endScreenSize; i += stepSize) i
    ];
    final conditionRange = myRange
        .map((e) => responsive_framework.Condition<double>.between(
            start: e, end: (e + stepSize), value: e.toDouble()))
        .toList();

    return [
      ...conditionRange,
      responsive_framework.Condition.largerThan(
          breakpoint: endScreenSize, value: endScreenSize.toDouble()),
    ];
  }
}
