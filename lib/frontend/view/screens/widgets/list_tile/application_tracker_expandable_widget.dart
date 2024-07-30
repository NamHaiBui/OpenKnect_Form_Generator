import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/status_expandable_list_tile.dart';

class ApplicationStatusTrackerWidget extends ConsumerWidget {
  final int currentStep;
  final List<String> steps;
  final bool isExample;

  const ApplicationStatusTrackerWidget({
    super.key,
    required this.currentStep,
    this.isExample = false,
    this.steps = const [
      "Applied",
      "Screen",
      "Interview",
      "Offer",
    ],
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: StatusExpandableListTile(
            isInConsideration: true,
            steps: steps,
            currentStep: currentStep,
            maxDotSize: maxDotSize,
            isExample: isExample),
      ),
    );
  }
}
