import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StepNotifier extends StateNotifier<int> {
  List<String> _steps = []; // Start with an empty list of steps

  StepNotifier() : super(0);

  void setSteps(List<String> newSteps) {
    _steps = newSteps;
    if (state >= _steps.length) {
      state = _steps.length - 1;
    }
  }

  void nextStep() {
    if (state < _steps.length - 1) {
      state++;
    }
  }

  void previousStep() {
    if (state > 0) {
      state--;
    }
  }

  void goToStep(int index) {
    if (index >= 0 && index < _steps.length) {
      state = index;
    } else {
      // Handle invalid index (e.g., show an error message)
      debugPrint("Invalid step index: $index");
    }
  }

  int get currentStepIndex => state;
  int get stepCount => _steps.length;
  String get currentStep => _steps[state];
}

final stepProvider =
    StateNotifierProvider<StepNotifier, int>((ref) => StepNotifier());
