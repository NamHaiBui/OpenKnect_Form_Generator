import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form/dynamic_form_model.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/components/dynamic_form_input.dart';

class DynamicFormService {
  static Future<FormBuilder?> parseJson(dynamic json) async {
    try {
      if (json == null) {
        debugPrint("Error parsing JSON: JSON is null");
        return null;
      }

      var decodedJson = DynamicForm.fromJson(jsonDecode(json));

      if (decodedJson.fields.isEmpty) {
        debugPrint("Error parsing JSON: Fields are empty" );
        return null;
      }

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
    } catch (e) {
      debugPrint("Error parsing JSON: ${e.toString()}");
      return null;
    }
  }
}
