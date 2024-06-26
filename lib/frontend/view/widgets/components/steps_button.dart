import 'package:flutter/material.dart';

class StepButton extends StatelessWidget {
  const StepButton({
    super.key,
    required this.steps,
    required this.i,
    required this.maxDotSize,
    required this.currentStep,
  });

  final List<String> steps;
  final int i;
  final double maxDotSize;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
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
