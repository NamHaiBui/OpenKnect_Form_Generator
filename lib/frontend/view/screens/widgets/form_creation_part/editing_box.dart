import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

class EditingBox extends StatefulWidget {
  final TextEditingController textPromptController;
  final Function(String?) onSaved;
  final void Function() showModal;

  const EditingBox({
    super.key,
    required this.textPromptController,
    required this.onSaved,
    required this.showModal,
  });

  @override
  State<EditingBox> createState() => _EditingBoxState();
}

class _EditingBoxState extends State<EditingBox> {
  bool update = false;
  String? jsonCode = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: SingleChildScrollView(
                    child: FormBuilder(
                      key: _formKey, // Assign the form key here
                      child: Column(
                        children: [
                          FormBuilderTextField(
                            controller: widget.textPromptController,
                            maxLines: 100,
                            name: "JSON",
                            validator: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.required(),
                              ],
                            ),
                            onSaved: (newValue) {
                              setState(() {
                                widget.textPromptController.text =
                                    newValue ?? "";
                                jsonCode = newValue;
                                update = true;
                                widget.onSaved(newValue);
                              });
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'JSON',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
