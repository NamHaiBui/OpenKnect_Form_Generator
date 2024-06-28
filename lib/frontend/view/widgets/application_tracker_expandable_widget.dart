import 'dart:math';

import 'package:flutter/material.dart';

import 'components/status_expandable_list_tile.dart';

class ApplicationStatusTrackerWidget extends StatelessWidget {
  final int currentStep;
  final List<String> steps;

  const ApplicationStatusTrackerWidget({
    super.key,
    required this.currentStep,
    this.steps = const [
      "Applied",
      "Screen",
      "Interview",
      "Offer",
    ],
  });

  @override
  Widget build(BuildContext context) {
    double maxDotSize = 0;
    for (int i = 0; i < steps.length; i++) {
      final textSize = TextPainter(
        text: TextSpan(
          text: steps[i],
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      maxDotSize = max(maxDotSize, textSize.size.width + 20); // Add padding
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: StatusExpandableListTile(
              steps: steps, currentStep: currentStep, maxDotSize: maxDotSize),
        ),
      ],
    );
  }
}
