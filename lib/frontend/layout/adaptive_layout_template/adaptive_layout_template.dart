import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openknect_form_generator/package_initialization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config.dart';
//Internal
import 'service/state_management.dart';
import 'widgets/custom_rail_destination.dart';
export 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
export 'config.dart';
export 'utils/responsive_utility.dart';
export 'widgets/image_wrapper.dart';
export 'widgets/max_width_box_widget.dart';

/// Creates a basic breakpoints
final List<Breakpoint> breakpoints = [
  Breakpoints.large,
  Breakpoints.medium,
  Breakpoints.small,
  Breakpoints.standard,
  Breakpoints.smallAndUp,
  Breakpoints.smallDesktop,
  Breakpoints.smallMobile,
  Breakpoints.mediumAndUp,
  Breakpoints.mediumDesktop,
  Breakpoints.largeDesktop,
  Breakpoints.largeMobile,
];

// ignore: must_be_immutable
/// [AdaptiveLayout].
class AdaptiveLayoutTemplate extends ConsumerStatefulWidget with Configurable {
  /// Creates a const [AdaptiveLayoutTemplate].
  AdaptiveLayoutTemplate(
      {super.key,
      required this.bodyWidgets,
      this.recentURLpath,
      this.configurationStrategy,
      this.staticRouting = false,
      this.mainNavigationTrailingNavBarWidgets,
      this.bottomNavigationWidgets,
      this.secondBodyWidgets,
      this.topNavigationWidgets,
      this.mainNavigationDestinations,
      this.mainNavigationLeadingWidgets,
      this.dynamicIndex});

  final Map<Breakpoint, Widget> Function(int selectedIndex) bodyWidgets;
  final Map<Breakpoint, Widget>? mainNavigationTrailingNavBarWidgets;
  final Map<Breakpoint, Widget>? mainNavigationLeadingWidgets;
  final Map<Breakpoint, List<NavigationDestination>>?
      mainNavigationDestinations;
  final Map<Breakpoint, List<NavigationDestination>>? bottomNavigationWidgets;
  final Map<Breakpoint, List<NavigationDestination>>? topNavigationWidgets;
  final Map<Breakpoint, Widget> Function(int selectedIndex)? secondBodyWidgets;
  final bool? staticRouting;
  final int? dynamicIndex;
  final String? recentURLpath;

  @override
  final ConfigurationStrategy? configurationStrategy;

  @override
  ConsumerState<AdaptiveLayoutTemplate> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<AdaptiveLayoutTemplate> {
  late Map<Breakpoint, Widget> currentBodyWidgets;
  late Map<Breakpoint, Widget> currentSecondaryBodyWidgets;
  late ConfigurationContext bodyContext;

  void _loadSelectedNavigation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int selectedNavigation =
        widget.dynamicIndex ?? prefs.getInt('selectedNavigation') ?? 0;
    ref
        .read(selectedNavigationProvider.notifier)
        .update((state) => selectedNavigation);
    currentBodyWidgets = widget.bodyWidgets(selectedNavigation);
    currentSecondaryBodyWidgets = widget.secondBodyWidgets != null
        ? widget.secondBodyWidgets!(selectedNavigation)
        : {};
  }

  @override
  void initState() {
    super.initState();
    _loadSelectedNavigation();
    bodyContext = widget.configurationContext;
    int selectedNavigation = ref.read(selectedNavigationProvider);
    currentBodyWidgets = widget.bodyWidgets(selectedNavigation);
    currentSecondaryBodyWidgets = widget.secondBodyWidgets != null
        ? widget.secondBodyWidgets!(selectedNavigation)
        : {};

    // Firebase Messaging setup
    ref
        .read(PackageInitialization.firebaseMessagingServiceProvider)
        .setup(context);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final colorScheme = Theme.of(context).colorScheme;

    final NavigationRailThemeData navRailTheme =
        Theme.of(context).navigationRailTheme;
    final bool isMedium = screenWidth < 840;

    // Helper function
    bool containsBreakpoint(
        Map<Breakpoint, dynamic>? map, Breakpoint breakpoint) {
      return map?.containsKey(breakpoint) ?? false;
    }

// Helper function clean URls to prevent XSS attacks
    String cleanUrlPath(String? path) {
      if (path == null) {
        return '';
      }
      // Define what characters are considered valid.
      String validCharacters = 'abcdefghijklmnopqrstuvwxyz/_-';
      // Construct a new path string, filtering out any invalid characters
      String newPath = '';
      for (int i = 0; i < path.length; i++) {
        String char = path[i];
        if (validCharacters.contains(char)) {
          newPath += char;
        }
      }
      // logger.i("newPath: $newPath");
      // Replace the old path with the new, cleaned path
      return newPath;
    }

//function This function takes a map of Breakpoints and Widgets and returns a map of Breakpoint to SlotLayoutConfig
//function for primary navigation
    Map<Breakpoint, SlotLayoutConfig?> buildPrimaryNavBarConfig(
      Map<Breakpoint, Widget>? leadingWidgets,
      Map<Breakpoint, List<NavigationDestination>>? destinations,
      Map<Breakpoint, Widget>? trailingWidgets,
      bool? staticRouting,
    ) {
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
            key: Key('Primary Navigation $breakpoint'),
            builder: (_) => standardNavigationRail(
                  width: isMedium ? 80 : 248,
                  padding: isMedium
                      ? const EdgeInsets.all(12)
                      : const EdgeInsets.all(8),
                  unSelectedLabelTextStyle: TextStyle(
                    color: colorScheme.onSurface,
                    fontSize: 14,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.clip,
                  ),

                  selectedIndex: ref.watch(selectedNavigationProvider),
                  onDestinationSelected: (int newIndex) async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setInt('selectedNavigation', newIndex);
                    ref
                        .watch(selectedNavigationProvider.notifier)
                        .update((state) => newIndex);
                    currentBodyWidgets = widget
                        .bodyWidgets(ref.watch(selectedNavigationProvider));
                    currentSecondaryBodyWidgets = widget.secondBodyWidgets !=
                            null
                        ? widget
                            .bodyWidgets(ref.watch(selectedNavigationProvider))
                        : {};
                    staticRouting == true
                        ? null
                        //!!! ignore: use_build_context_synchronously
                        // ignore: use_build_context_synchronously
                        : context.go(
                            '${widget.recentURLpath ?? '/'}${cleanUrlPath(destinations?[breakpoint]?[ref.watch(selectedNavigationProvider)].key.toString())}');
                  },
                  extended: breakpoint == Breakpoints.large ? true : false,
                  leading: leadingWidgets?[breakpoint] ??
                      const SizedBox
                          .shrink(), // use null if not present in the map
                  destinations: destinations != null &&
                          destinations.containsKey(breakpoint)
                      ? breakpoint == Breakpoints.medium
                          ? destinations[breakpoint]!
                              .map((navDes) => CustomRailDestination
                                      .toCustomRailDestinationMedium(
                                    ref,
                                    navDes,
                                    destinations[breakpoint]!,
                                    navDes.key.toString(),
                                  ))
                              .toList()
                          : breakpoint == Breakpoints.small
                              ? destinations[breakpoint]!
                                  .map((navDes) => CustomRailDestination
                                          .toCustomRailDestinationMedium(
                                        ref,
                                        navDes,
                                        destinations[breakpoint]!,
                                        navDes.key.toString(),
                                      ))
                                  .toList()
                              : breakpoint == Breakpoints.large
                                  ? destinations[breakpoint]!
                                      .map((navDes) => CustomRailDestination
                                              .toCustomRailDestinationLarge(
                                            ref,
                                            navDes,
                                            destinations[breakpoint]!,
                                            navDes.key.toString(),
                                          ))
                                      .toList()
                                  : destinations[breakpoint]!
                                      .map((navDes) =>
                                          AdaptiveScaffold.toRailDestination(
                                              navDes))
                                      .toList()
                      : [], // use an empty list if not present in the map
                  trailing: trailingWidgets?[breakpoint] ??
                      const SizedBox
                          .shrink(), // use null if not present in the map
                  backgroundColor: colorScheme.surface,
                  selectedIconTheme: IconThemeData(
                    opticalSize: 23,
                    color: colorScheme.onSurface,
                    size: 2,
                  ),
                  unselectedIconTheme: navRailTheme.unselectedIconTheme,
                  selectedLabelTextStyle: TextStyle(
                    // height: 10,
                    // backgroundColor: Colors.red,
                    color: colorScheme.onSurface,
                    fontSize: 16,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.clip,
                  ),
                ));

        // Add this configuration to the final map
        config[breakpoint] = slotLayoutConfig;
      }

      return config;
    }

    //function This function takes a map of Breakpoints to Widgets and returns a map of Breakpoint to SlotLayoutConfig
    Map<Breakpoint, SlotLayoutConfig?> buildPrimaryBottomNavBarConfig(
      Map<Breakpoint, List<NavigationDestination>>?
          bottomNavigationDestinations,
      bool? staticRouting,
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
          // inAnimation: AdaptiveScaffold.leftOutIn,
          // outAnimation: AdaptiveScaffold.fadeOut,
          key: Key('Bottom Navigation $breakpoint'),
          builder: (_) => AdaptiveScaffold.standardBottomNavigationBar(
            currentIndex: ref.watch(selectedNavigationProvider) == 7
                ? 2
                : ref.watch(selectedNavigationProvider) == 8
                    ? 3
                    : ref.watch(selectedNavigationProvider),

            onDestinationSelected: (int newIndex) async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setInt('selectedNavigation', newIndex);
              ref
                  .watch(selectedNavigationProvider.notifier)
                  .update((state) => newIndex);
              currentBodyWidgets =
                  widget.bodyWidgets(ref.watch(selectedNavigationProvider));
              currentSecondaryBodyWidgets = widget.secondBodyWidgets != null
                  ? widget.bodyWidgets(ref.watch(selectedNavigationProvider))
                  : {};
              staticRouting == true
                  ? null
                  //!!! ignore: use_build_context_synchronously
                  // ignore: use_build_context_synchronously
                  : context.go(
                      '${widget.recentURLpath ?? '/'}${cleanUrlPath(bottomNavigationDestinations?[breakpoint]?[ref.watch(selectedNavigationProvider)].key.toString())}');
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

    // AdaptiveLayout has a number of slots that take SlotLayouts and these
    // SlotLayouts' configs take maps of Breakpoints to SlotLayoutConfigs.
    return AdaptiveLayout(
      internalAnimations: false,
      // Primary navigation config has nothing from 0 to 600 dp screen width,
      // then an unextended NavigationRail with no labels and just icons then an
      // extended NavigationRail with both icons and labels.
      primaryNavigation: SlotLayout(
        config: buildPrimaryNavBarConfig(
          widget.mainNavigationLeadingWidgets,
          widget.mainNavigationDestinations,
          widget.mainNavigationTrailingNavBarWidgets,
          widget.staticRouting,
        ),
      ),
      body: SlotLayout(
          config: bodyContext.buildBodyConfiguration(currentBodyWidgets)),
      secondaryBody: SlotLayout(
          config: bodyContext
              .buildSecondaryBodyConfiguration(currentSecondaryBodyWidgets)),
      topNavigation: SlotLayout(
        config: buildPrimaryBottomNavBarConfig(
          widget.topNavigationWidgets,
          widget.staticRouting,
        ),
      ),
      bottomNavigation: SlotLayout(
        config: buildPrimaryBottomNavBarConfig(
          widget.bottomNavigationWidgets,
          widget.staticRouting,
        ),
      ),
    );
  }
}

Builder standardBottomNavigationBar({
  required List<NavigationDestination> destinations,
  int? currentIndex,
  double iconSize = 24,
  ValueChanged<int>? onDestinationSelected,
}) {
  return Builder(
    builder: (BuildContext context) {
      final NavigationBarThemeData currentNavBarTheme =
          NavigationBarTheme.of(context);
      return NavigationBarTheme(
          data: currentNavBarTheme.copyWith(
            iconTheme:
                WidgetStateProperty.resolveWith((Set<WidgetState> states) {
              return currentNavBarTheme.iconTheme
                      ?.resolve(states)
                      ?.copyWith(size: iconSize) ??
                  IconTheme.of(context).copyWith(size: iconSize);
            }),
          ),
          child: NavigationBar(
            animationDuration: const Duration(seconds: 1),
            selectedIndex: currentIndex ?? 0,
            destinations: destinations,
            onDestinationSelected: onDestinationSelected,
          ));
    },
  );
}

Builder standardNavigationRail({
  required List<NavigationRailDestination> destinations,
  double width = 72,
  int? selectedIndex,
  bool extended = false,
  Color? backgroundColor,
  EdgeInsetsGeometry padding = const EdgeInsets.all(8),
  Widget? leading,
  Widget? trailing,
  Function(int)? onDestinationSelected,
  double? groupAlignment,
  IconThemeData? selectedIconTheme,
  IconThemeData? unselectedIconTheme,
  TextStyle? selectedLabelTextStyle,
  TextStyle? unSelectedLabelTextStyle,
  NavigationRailLabelType labelType = NavigationRailLabelType.none,
}) {
  if (extended && width == 72) {
    width = 192;
  }
  return Builder(builder: (BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        width: width,
        height: MediaQuery.of(context).size.height,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: NavigationRail(
                    indicatorShape: const StadiumBorder(),
                    // indicatorColor: brandBlue.withOpacity(0.12),
                    useIndicator: false,
                    labelType: labelType,
                    leading: leading,
                    trailing: trailing,
                    onDestinationSelected: onDestinationSelected,
                    groupAlignment: groupAlignment,
                    backgroundColor: backgroundColor,
                    extended: extended,
                    selectedIndex: selectedIndex,
                    selectedIconTheme: selectedIconTheme,
                    unselectedIconTheme: unselectedIconTheme,
                    selectedLabelTextStyle: selectedLabelTextStyle,
                    unselectedLabelTextStyle: unSelectedLabelTextStyle,
                    destinations: destinations,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  });
}
