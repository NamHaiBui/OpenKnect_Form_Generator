// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:convert';
import 'dart:html' as html;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:openknect_form_generator/frontend/layout/split_view.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form/dynamic_form_model.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/form_creation_part/editing_box.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/form_creation_part/suggestion_modal.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/components/dynamic_form_input.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

class PlaygroundWidget extends StatefulWidget {
  final int currentStep;
  const PlaygroundWidget({super.key, required this.currentStep});

  @override
  State<PlaygroundWidget> createState() => _PlaygroundWidgetState();
}

class _PlaygroundWidgetState extends State<PlaygroundWidget> {
  DynamicForm? parsedForm;
  late List<String> errorMessages;
  bool update = false;
  String? jsonCode = "";
  final TextEditingController textPromptController = TextEditingController();
  final TextEditingController _fileNameController = TextEditingController();
  String? _suggestedFileName;

  Future<void> _saveInputToFile(String jsonCode, String fileName) async {
    try {
      if (kIsWeb) {
        // Web Handling (same as before)
        final formattedJson =
            const JsonEncoder.withIndent('  ').convert(jsonCode);
        final blob = html.Blob([formattedJson], 'application/json');
        final url = html.Url.createObjectUrlFromBlob(blob);

        final anchor = html.AnchorElement(href: url)
          ..setAttribute(
              'download', fileName) // Use the fileName from the widget
          ..style.display = 'none';

        html.document.body?.append(anchor);
        anchor.click();

        html.Url.revokeObjectUrl(url);
        html.document.body?.children.remove(anchor);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Input saved to: $fileName')),
        );
      } else {
        // Other Platforms
        String? outputFile;

        if (Platform.isWindows) {
          // Handle Windows (same as before)
          outputFile = await FilePicker.platform.saveFile(
            dialogTitle: 'Please select an output file:',
            fileName: fileName,
            type: FileType.custom,
            allowedExtensions: ['json'],
          );
        } else {
          // Handle iOS, Android, macOS, Linux
          final directory = await getApplicationDocumentsDirectory();
          outputFile = '${directory.path}/$fileName';
          final file = File(outputFile);
          await file.writeAsString(jsonCode);
        }

        if (outputFile != null) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Input saved to: $outputFile')),
            );
          }
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving input: $e')),
        );
      }
    }
  }

  void _showFileNameDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enter File Name'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _fileNameController,
              decoration: const InputDecoration(
                labelText: 'File Name',
              ),
            ),
            const SizedBox(height: 16),
            if (_suggestedFileName != null)
              Text('Suggestion: $_suggestedFileName'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _suggestFileName(_fileNameController.text.trim());
              },
              child: const Text('Suggest File Name'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              _saveInputToFile(
                jsonCode!,
                _fileNameController.text.trim(),
              );
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _suggestFileName(String input) {
    final now = DateTime.now();
    final datePart = DateFormat('yyyy-MM-dd').format(now);

    setState(() {
      // Example template: document_{date}_{input}
      _suggestedFileName =
          "document_${datePart}_${input.replaceAll(RegExp(r'[^\w\s-]'), '').replaceAll(' ', '_').toLowerCase()}";
    });
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
      // debugPrint(json);
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
      });
      if (context.mounted) {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
      }
      return const Text('Please review the error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return VerticalSplitView(
        left: EditingBox(
          onError: (errorMessage) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(errorMessage)),
            );
            Future.delayed(const Duration(seconds: 3), () {
              if (context.mounted) {
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
              }
            });
          },
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
                Container(
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey)),
                  ),
                  child: SingleChildScrollView(
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
                ),
                MaterialButton(
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: _showFileNameDialog,
                  child: const Text('Save to File'),
                ),
              ],
            ),
          ),
        ));
  }
}
