import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openknect_form_generator/frontend/provider/editing_provider.dart';
import 'package:openknect_form_generator/frontend/view/page/widget/playground.dart';

class FormCreationWidget extends ConsumerStatefulWidget {
  const FormCreationWidget({super.key, required this.processBar});
  final Widget processBar;

  @override
  ConsumerState<FormCreationWidget> createState() => _FormCreationWidgetState();
}

class _FormCreationWidgetState extends ConsumerState<FormCreationWidget> {
  bool _showProcessBar = true; // State to control visibility

  @override
  Widget build(BuildContext context) {
    // Watch the stepProvider to get the current step
    final currentStep = ref.watch(stepProvider);
    final stepNotifier = ref.watch(stepProvider.notifier);

    return Scaffold(
      appBar: _showProcessBar
          ? AppBar(
              title: widget.processBar,
              backgroundColor: Colors.yellow[200],
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              elevation: 4,
            )
          : null,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: PlaygroundWidget(
                  currentStep:
                      currentStep, // Use the current step from the provider
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Safely constraint the previous button
                if (currentStep != 0)
                  MaterialButton(
                    color: Theme.of(context).colorScheme.secondary,
                    onPressed: () {
                      stepNotifier.previousStep();
                    },
                    child: const Text('Previous'),
                  ),
                // Safely constraint the next button
                if (currentStep < stepNotifier.stepCount)
                  MaterialButton(
                    color: Theme.of(context).colorScheme.secondary,
                    onPressed: () {
                      stepNotifier.nextStep();
                    },
                    child: const Text('Next'),
                  ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _showProcessBar = !_showProcessBar;
          });
        },
        child: Icon(_showProcessBar ? Icons.visibility_off : Icons.visibility),
      ),
    );
  }
}
