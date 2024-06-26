import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openknect_form_generator/frontend/layout/adaptive_layout_template/adaptive_layout_template.dart';

final selectedNavigationProvider = StateProvider<int>((ref) => 1);

final hoverProvider = StateProvider.family<bool, String>((ref, id) => false);

class BodyWidgetsState extends StateNotifier<Map<Breakpoint, Widget>> {
  BodyWidgetsState() : super({});

  void updateBodyWidgets(Map<Breakpoint, Widget> newBodyWidgets) {
    state = newBodyWidgets;
  }
}

class SecondaryBodyWidgetsState extends StateNotifier<Map<Breakpoint, Widget>> {
  SecondaryBodyWidgetsState() : super({});

  void updateSecondaryBodyWidgets(
      Map<Breakpoint, Widget> newSecondaryBodyWidgets) {
    state = newSecondaryBodyWidgets;
  }
}

class BodyWidgetsNotifier extends StateNotifier<Map<Breakpoint, Widget>> {
  BodyWidgetsNotifier() : super({});

  void updateBodyWidgets(Map<Breakpoint, Widget> newBodyWidgets) {
    state = newBodyWidgets;
  }
}

final bodyWidgetsProvider =
    StateNotifierProvider<BodyWidgetsState, Map<Breakpoint, Widget>>(
  (ref) => BodyWidgetsState(),
);

final secondaryBodyWidgetsProvider =
    StateNotifierProvider<SecondaryBodyWidgetsState, Map<Breakpoint, Widget>>(
  (ref) => SecondaryBodyWidgetsState(),
);

final currentBodyWidgetsProvider =
    StateNotifierProvider<BodyWidgetsNotifier, Map<Breakpoint, Widget>>(
        (ref) => BodyWidgetsNotifier());

final currentSecondaryBodyWidgetsProvider =
    StateNotifierProvider<BodyWidgetsNotifier, Map<Breakpoint, Widget>>(
        (ref) => BodyWidgetsNotifier());
