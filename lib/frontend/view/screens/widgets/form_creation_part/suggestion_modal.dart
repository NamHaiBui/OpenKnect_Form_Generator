import 'package:flutter/material.dart';
import 'package:openknect_form_generator/gemini_initialization.dart';

class PromptModal extends StatefulWidget {
  // Changed to ConsumerStatefulWidget
  final TextEditingController textBoxController;

  const PromptModal({super.key, required this.textBoxController});

  @override
  State<PromptModal> createState() =>
      _PromptModalState(); // Created a state class
}

class _PromptModalState extends State<PromptModal> {
  // State class
  TextEditingController commandController = TextEditingController();

  Future<void> _callGeminiService(String command) async {

    try {
      final response =
          await GeminiInitializer.call(command);
      setState(() {
        if (response.text != null) {
          widget.textBoxController.text = response.text!;
        } else {
          // Handle the case where response.text is null
          widget.textBoxController.text = "Error: Could not generate content";
        }
      });
    } catch (error) {
      // Handle the error here
      debugPrint("Error calling Gemini service: $error");
      setState(() {
        widget.textBoxController.text = "Error: Could not generate content";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Enter Request'),
      content: TextField(controller: commandController),
      actions: [
        TextButton(
          onPressed: () async {
            await _callGeminiService(commandController.text);
            commandController.clear();
            if (mounted) {
              Navigator.pop(context);
            }
          },
          child: const Text('Generate'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    commandController.dispose(); // Dispose of the controller
    super.dispose();
  }
}
