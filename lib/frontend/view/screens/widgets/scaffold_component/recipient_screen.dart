import 'dart:convert';
import 'dart:io'; // For File class
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RecipientScreen extends StatefulWidget {
  const RecipientScreen({super.key});

  @override
  State<RecipientScreen> createState() => _RecipientScreenState();
}

class _RecipientScreenState extends State<RecipientScreen> {
  String _selectedOption = 'URL';
  final TextEditingController _linkController = TextEditingController();
  dynamic _parsedJson;

  Future<void> _loadAndParseJson() async {
    String link = _linkController.text;

    try {
      dynamic jsonData;

      if (_selectedOption == 'URL') {
        final response = await http.get(Uri.parse(link));
        if (response.statusCode == 200) {
          jsonData = json.decode(response.body);
        } else {
          throw Exception('Failed to load JSON from URL');
        }
      } else {
        final file = File(link);
        if (await file.exists()) {
          final contents = await file.readAsString();
          jsonData = json.decode(contents);
        } else {
          throw Exception('Local JSON file not found');
        }
      }

      setState(() {
        _parsedJson = jsonData;
      });
    } catch (error) {
      // Handle errors (e.g., invalid JSON, network issues)
      debugPrint('Error loading JSON: $error');
      // Display an error message to the user
    }
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
        TextField(
          controller: _linkController,
          decoration: InputDecoration(
            labelText:
                _selectedOption == 'URL' ? 'Enter URL' : 'Enter Local Path',
          ),
        ),
        ElevatedButton(
          onPressed: _loadAndParseJson,
          child: Text('Load and Parse JSON'),
        ),
        if (_parsedJson != null) Text('Parsed JSON: ${_parsedJson.toString()}'),
      ],
    );
  }
}
