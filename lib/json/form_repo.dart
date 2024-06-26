import 'dart:convert';

import 'package:openknect_form_generator/constants/form_json.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form_model.dart';

class FormRepository {
  const FormRepository();

  String getJson() {
    return FormJson.formJson;
  }

  Future<DynamicForm> loadForm() async {
    final dynamicForm = DynamicForm.fromJson(jsonDecode(getJson()));
    return dynamicForm;
  }
}
