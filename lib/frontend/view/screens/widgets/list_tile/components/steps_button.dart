import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openknect_form_generator/frontend/provider/editing_provider.dart';

class StepButton extends ConsumerWidget {
  const StepButton({
    super.key,
    required this.steps,
    required this.i,
    required this.maxDotSize,
    required this.currentStep,
    this.isExample = false,
  });

  final List<String> steps;
  final int i;
  final double maxDotSize;
  final int currentStep;

  final bool isExample;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stepNotifier = ref.read(stepProvider.notifier);
    return InkWell(
      onTap: () {
        isExample
            ? stepNotifier.goToStep(i)
            : showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(steps[i]),
                    content: Text("This is the ${steps[i]} step."),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Close"),
                      ),
                    ],
                  );
                },
              );
      },
      child: Container(
        width: maxDotSize,
        height: maxDotSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentStep > i ? Colors.blue : Colors.grey[300],
        ),
        child: Center(
          child: Text(
            steps[i],
            style: TextStyle(
              color: currentStep > i ? Colors.white : Colors.black,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
