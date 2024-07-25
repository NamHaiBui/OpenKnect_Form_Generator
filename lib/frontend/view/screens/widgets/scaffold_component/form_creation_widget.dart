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
    final stepNotifier = ref.watch(stepProvider.notifier);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  // The main content of the Scaffold
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 1.2,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        // Space for the sticky widget
                        // Only show the space if the process bar is visible
                        _showProcessBar
                            ? const SizedBox(height: 80)
                            : const SizedBox.shrink(),
                        PlaygroundWidget(
                          currentStep: stepNotifier.currentStepIndex,
                        ),
                      ],
                    ),
                  ),

                  // The sticky widget
                  // Only show the process bar if _showProcessBar is true
                  if (_showProcessBar)
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.yellow[200], // Sticker background color
                          borderRadius:
                              BorderRadius.circular(10), // Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child:
                            widget.processBar, // The actual processBar widget
                      ),
                    ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _showProcessBar = !_showProcessBar;
                          });
                        },
                        child: Text(_showProcessBar
                            ? 'Hide Process Bar'
                            : 'Show Process Bar'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
