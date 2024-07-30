import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'dart:convert';

final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

class EditingBox extends StatefulWidget {
  final TextEditingController textPromptController;
  final Function(String?) onSaved;
  final void Function() showModal;
  final void Function(String) onError; // New error callback

  const EditingBox({
    super.key,
    required this.textPromptController,
    required this.onSaved,
    required this.showModal,
    required this.onError,
  });

  @override
  State<EditingBox> createState() => _EditingBoxState();
}

class _EditingBoxState extends State<EditingBox> {
  bool update = false;
  String? jsonCode = "";

  @override
  void initState() {
    super.initState();
    widget.textPromptController.addListener(_lintJson);
  }

  @override
  void dispose() {
    widget.textPromptController.removeListener(_lintJson);
    super.dispose();
  }

  void _lintJson() {
    final text = widget.textPromptController.text;
    if (text.isEmpty) return;

    try {
      // Attempt to parse the JSON
      final jsonObject = json.decode(text);
      
      // If successful, re-encode it with indentation for pretty printing
      final prettyJson = const JsonEncoder.withIndent('  ').convert(jsonObject);
      
      // Update the text field with pretty-printed JSON
      if (text != prettyJson) {
        widget.textPromptController.value = TextEditingValue(
          text: prettyJson,
          selection: TextSelection.collapsed(offset: prettyJson.length),
        );
      }
    } catch (e) {
      // If parsing fails, call the error callback
      widget.onError(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: widget.showModal,
                        icon: const Icon(Icons.star)),
                    MaterialButton(
                      color: Theme.of(context).colorScheme.secondary,
                      onPressed: () async {
                        _formKey.currentState?.saveAndValidate();
                      },
                      child: const Text('Save & Generate'),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: FormBuilder(
                  key: _formKey, 
                  child: FormBuilderTextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    maxLines: null,
                    controller: widget.textPromptController,
                    name: "JSON",
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(),
                      ],
                    ),
                    onSaved: (newValue) {
                      setState(() {
                        widget.textPromptController.text = newValue ?? "";
                        jsonCode = newValue;
                        update = true;
                        widget.onSaved(newValue);
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}