import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:openknect_form_generator/frontend/layout/split_view.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form/dynamic_form_model.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/form_creation_part/editing_box.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/form_creation_part/suggestion_modal.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/components/dynamic_form_input.dart';
import 'package:path_provider/path_provider.dart';

class PlaygroundWidget extends StatefulWidget {
  final int currentStep;
  const PlaygroundWidget({super.key, required this.currentStep});

  @override
  State<PlaygroundWidget> createState() => _PlaygroundWidgetState();
}

class _PlaygroundWidgetState extends State<PlaygroundWidget> {
  late String _filePath = '';
  DynamicForm? parsedForm;
  late List<String> errorMessages;
  bool update = false;
  String? jsonCode = "";
  final TextEditingController textPromptController = TextEditingController();
  Future<void> _saveInputToFile(String jsonCode) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      _filePath = '${directory.path}/${widget.currentStep}.txt';
      final file = File(_filePath);
      await file.writeAsString(jsonCode);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Input saved to: $_filePath')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving input: $e')),
        );
      }
    }
  }

  @override
  void initState() {
    errorMessages = [];
    super.initState();
    parsedForm = null;
    textPromptController.text = """{
  "id": 1,
  "name": "Contact Details Form",
  "fields": [
    {
      "type": "textBox",
      "label": "Text Input",
      "initialValue": ["Initial Text"],
      "key": "textInput",
      "text": "Enter text here",
      "options": [],
      "validations": {
        "required": true,
        "minLength": 5,
        "maxLength": 20
      }
    }
  ]
}""";
  }

  void _showModal() {
    showDialog(
        context: context,
        builder: (context) =>
            PromptModal(textBoxController: textPromptController));
  }

  @override
  void dispose() {
    textPromptController.dispose();
    super.dispose();
  }

  Widget attemptParsing(String json) {
    try {
      // Decode the JSON string
      debugPrint(json);
      var decodedJson = DynamicForm.fromJson(jsonDecode(json));
      setState(
        () {
          parsedForm = decodedJson;
          update = false;
          errorMessages.clear();
        },
      );
      // Build the example
      return FormBuilder(
        child: Column(
          children: decodedJson.fields
              .map<Widget>(
                (field) => DynamicFormInput(
                  field: field,
                  onSaved: (p0) {},
                  onSubmit: (p0) {},
                ),
              )
              .toList(),
        ),
      );
    } catch (error) {
      setState(() {
        errorMessages.add('Invalid JSON: $error');
      });
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: errorMessages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              errorMessages[index],
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: VerticalSplitView(
            left: EditingBox(
              textPromptController: textPromptController,
              onSaved: (newValue) {
                setState(() {
                  jsonCode = newValue;
                  update = true;
                });
              },
              showModal: _showModal,
            ),
            right: Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: update
                          ? attemptParsing(
                              jsonCode ?? "") // parse the following form
                          : parsedForm !=
                                  null // If bad parse then display the latest form parsed
                              ? FormBuilder(
                                  child: Column(
                                    children: parsedForm!.fields
                                        .map<Widget>(
                                          (field) => DynamicFormInput(
                                            field: field,
                                            onSaved: (p0) {},
                                            onSubmit: (p0) {},
                                          ),
                                        )
                                        .toList(),
                                  ),
                                )
                              : const Center(
                                  child: Text("No JSON provided"),
                                ),
                    ),
                    MaterialButton(
                      color: Theme.of(context).colorScheme.secondary,
                      onPressed: () async {
                        if (jsonCode != null && jsonCode!.isNotEmpty) {
                          await _saveInputToFile(jsonCode!);
                        }
                      },
                      child: const Text('Save to File'),
                    ),
                  ],
                ),
              ),
            )));
  }
}
