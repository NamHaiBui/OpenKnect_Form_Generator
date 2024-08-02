import 'package:flutter/material.dart';

class FilePickerWidget extends StatefulWidget {
  final Future<void> Function() pickFileFnc;
  const FilePickerWidget({super.key, required this.pickFileFnc});

  @override
  State<FilePickerWidget> createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {
  String? _selectedFilePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: widget.pickFileFnc,
          child: const Text('Pick File'),
        ),
        if (_selectedFilePath != null)
          Text('Selected File: $_selectedFilePath'),
      ],
    );
  }
}
