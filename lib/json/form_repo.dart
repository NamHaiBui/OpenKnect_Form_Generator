import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:openknect_form_generator/constants/form_json.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form/dynamic_form_model.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class FormRepository {
  const FormRepository();

  get http => null;

  String getJson() {
    return FormJson.formJson;
  }

  String getAdminFormJson() {
    return FormJson.adminFormJson;
  }

  Future<String> getFormViaUrl(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to load form from URL: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching form from URL: $e');
      rethrow; // Rethrow the exception to be handled by the caller
    }
  }

  Future<String> getFormViaLocal(String localURL) async {
    try {
      final appDocDir = await getApplicationDocumentsDirectory();
      final filePath = '${appDocDir.path}/$localURL';
      final file = File(filePath);
      if (await file.exists()) {
        final jsonString = await file.readAsString();
        return jsonString;
      } else {
        throw Exception('Form file not found at: $filePath');
      }
    } catch (e) {
      debugPrint('Error fetching form from local file: $e');
      rethrow;
    }
  }

  Future<DynamicForm> loadForm(String formId) async {
    try {
      final dynamicForm = DynamicForm.fromJson(jsonDecode(getJson()));
      return dynamicForm;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<DynamicForm> loadAdminForm() async {
    try {
      final dynamicForm = DynamicForm.fromJson(jsonDecode(getAdminFormJson()));
      return dynamicForm;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
