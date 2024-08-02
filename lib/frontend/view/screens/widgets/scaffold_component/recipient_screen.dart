import 'dart:convert';
import 'dart:io'; // For File class
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:http/http.dart' as http;
import 'package:openknect_form_generator/frontend/model/dynamic_form/dynamic_form_model.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/components/dynamic_form_input.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/scaffold_component/components/file_picker_widget.dart';

class RecipientScreen extends StatefulWidget {
  const RecipientScreen({super.key});

  @override
  State<RecipientScreen> createState() => _RecipientScreenState();
}

class _RecipientScreenState extends State<RecipientScreen> {
  String _selectedOption = 'URL';
  final TextEditingController _linkController = TextEditingController();
  dynamic _parsedJson;

  Future<void> _loadJSON() async {
    try {
      dynamic jsonData = await (_selectedOption == 'URL'
          ? _loadJsonFromUrl()
          : _loadJsonFromFile());

      setState(() => _parsedJson = jsonData);
    } catch (error) {
      _handleError(error);
    }
  }

  Future<dynamic> _loadJsonFromUrl() async {
    final response = await http.get(Uri.parse(_linkController.text));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    throw Exception('Failed to load JSON from URL');
  }

  Future<dynamic> _loadJsonFromFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );

    if (result == null) return null; // User canceled the picker

    if (kIsWeb) {
      return _parseWebFile(result.files.single.bytes!);
    } else {
      return _parseNativeFile(result.files.single.path!);
    }
  }

  Future<dynamic> _parseWebFile(Uint8List bytes) async {
    String contents = String.fromCharCodes(bytes);
    return json.decode(contents);
  }

  Future<dynamic> _parseNativeFile(String path) async {
    File file = File(path);
    String contents = await file.readAsString();
    return json.decode(contents);
  }

  void _handleError(dynamic error) {
    debugPrint('Error loading JSON: $error');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<String>(
          value: _selectedOption,
          onChanged: (String? newValue) {
            setState(() {
              _selectedOption = newValue!;
            });
          },
          items: <String>['URL', 'Local Path']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        _selectedOption == 'URL'
            ? TextField(
                controller: _linkController,
                decoration: const InputDecoration(
                  labelText: 'Enter URL',
                ),
              )
            : FilePickerWidget(
                pickFileFnc: _loadJSON,
              ),
        ElevatedButton(
          onPressed: _loadJSON,
          child: const Text('Load and Parse JSON'),
        ),
        if (_parsedJson != null)
          Builder(
            builder: (context) {
              try {
                var decodedJson = DynamicForm.fromJson(jsonDecode(_parsedJson));
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: SingleChildScrollView(
                      child: FormBuilder(
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
                  )),
                );
              } catch (e) {
                debugPrint("Error parsing JSON: ${e.toString()}");
                return const Text("Error parsing JSON");
              }
            },
          )
      ],
    );
  }
}
