import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openknect_form_generator/layout/theme_system/data/color_scheme.dart';
import 'package:openknect_form_generator/layout/theme_system/widgets/openknect_icon.dart';
// import 'package:openknect_app/app_common/presentation/view/widgets/openknect_icon.dart';
// import 'package:openknect_app/features/theme_system/theme_system.dart';

import '../service/state_management.dart';

class CustomRailDestination {
  static NavigationRailDestination toCustomRailDestinationLarge(
    WidgetRef ref,
    NavigationDestination destination,
    List<NavigationDestination> destinations,
    final String id,
  ) {
    // Assume selectedIndex is the current index of the selected item.
    final selectedIndex = ref.watch(selectedNavigationProvider);
    final currentIndex = destinations.indexOf(destination);
    return NavigationRailDestination(
      label: LabelWidget(
        text: destination.label,
        id: id,
        selected: currentIndex == selectedIndex,
      ),
      icon: IconWidget(
        childIcon: destination.icon,
        id: id,
        selected: currentIndex == selectedIndex,
      ),
      selectedIcon: SelectedIconWidget(
        childIcon: destination.selectedIcon!,
        id: id,
        selected: currentIndex == selectedIndex,
      ),
    );
  }

  static NavigationRailDestination toCustomRailDestinationMedium(
    WidgetRef ref,
    NavigationDestination destination,
    List<NavigationDestination> destinations,
    final String id,
  ) {
    // Assume selectedIndex is the current index of the selected item.
    final selectedIndex = ref.watch(selectedNavigationProvider);
    final currentIndex = destinations.indexOf(destination);
    return NavigationRailDestination(
      label: LabelWidget(
        text: destination.label,
        id: id,
        selected: currentIndex == selectedIndex,
      ),
      icon: IconWidget(
        childIcon: destination.icon,
        id: id,
        selected: currentIndex == selectedIndex,
        withLabel: false,
      ),
      selectedIcon: SelectedIconWidget(
        childIcon: destination.selectedIcon!,
        id: id,
        selected: currentIndex == selectedIndex,
        withLabel: false,
      ),
    );
  }
}

class LabelWidget extends ConsumerWidget {
  final String text;
  final String id;
  final bool selected;

  const LabelWidget(
      {super.key, required this.text, required this.id, this.selected = false});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHovering = ref.watch(hoverProvider(id));
    final bgColor = selected
        ? brandBlue.withOpacity(0.12)
        : (isHovering ? brandBlue.withOpacity(0.08) : sidebarBackground);
    return MouseRegion(
      onEnter: (_) => ref.read(hoverProvider(id).notifier).state = true,
      onExit: (_) => ref.read(hoverProvider(id).notifier).state = false,
      cursor: SystemMouseCursors.click,
      child: Container(
        width: 160,
        height: 64,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 24),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            softWrap: true,
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                // fontSize: 16,
                // fontWeight: FontWeight.w400,
                color: isHovering ? brandBlue : sidebarSelectedText),
          ),
        ),
      ),
    );
  }
}

class IconWidget extends ConsumerWidget {
  final Widget childIcon;
  final String id;
  final bool selected;
  final bool withLabel;
  const IconWidget(
      {super.key,
      required this.childIcon,
      required this.id,
      this.selected = false,
      this.withLabel = true});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHovering = ref.watch(hoverProvider(id));
    final bgColor = selected
        ? brandBlue.withOpacity(0.12)
        : (isHovering ? brandBlue.withOpacity(0.08) : sidebarBackground);

    return MouseRegion(
      onEnter: (_) => ref.read(hoverProvider(id).notifier).state = true,
      onExit: (_) => ref.read(hoverProvider(id).notifier).state = false,
      cursor: SystemMouseCursors.click,
      child: Stack(children: [
        Container(
          padding:
              withLabel ? const EdgeInsets.all(32) : const EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: withLabel
                ? const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )
                : const BorderRadius.all(Radius.circular(20)),
          ),
        ),
        Positioned(
          top: withLabel ? 20 : 24,
          left: withLabel ? 32 : 24,
          child: Align(
              alignment: Alignment.bottomCenter,
              child: IconTheme(
                data: IconThemeData(
                    color: isHovering ? brandBlue : sidebarSelectedText),
                child: OpenKnectIconWidget(
                  width: withLabel ? 24 : 32,
                  height: withLabel ? 24 : 32,
                  iconPath: (childIcon as OpenKnectIconWidget).iconPath,
                  iconColor: isHovering ? brandBlue : sidebarSelectedText,
                ),
              )),
        ),
      ]),
    );
  }
}

class SelectedIconWidget extends ConsumerWidget {
  final Widget childIcon;
  final String id;
  final bool selected;
  final bool withLabel;
  const SelectedIconWidget(
      {super.key,
      required this.childIcon,
      required this.id,
      this.selected = false,
      this.withLabel = true});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHovering = ref.watch(hoverProvider(id));
    final bgColor = selected
        ? brandBlue.withOpacity(0.12)
        : (isHovering ? brandBlue.withOpacity(0.08) : sidebarBackground);

    return MouseRegion(
      onEnter: (_) => ref.read(hoverProvider(id).notifier).state = true,
      onExit: (_) => ref.read(hoverProvider(id).notifier).state = false,
      cursor: SystemMouseCursors.click,
      child: Stack(children: [
        Container(
          padding:
              withLabel ? const EdgeInsets.all(32) : const EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: withLabel
                ? const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )
                : const BorderRadius.all(Radius.circular(20)),
          ),
        ),
        Positioned(
          top: withLabel ? 20 : 24,
          left: withLabel ? 32 : 24,
          child: Align(
              alignment: Alignment.center,
              child: IconTheme(
                data: IconThemeData(
                    color: isHovering ? brandBlue : sidebarSelectedText),
                child: OpenKnectIconWidget(
                  width: withLabel ? 24 : 32,
                  height: withLabel ? 24 : 32,
                  iconPath: (childIcon as OpenKnectIconWidget).iconPath,
                  iconColor: isHovering ? brandBlue : sidebarSelectedText,
                ),
              )),
        ),
      ]),
    );
  }
}
