import 'package:json/json.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form/dynamic_form_model.dart';

@JsonCodable()
class Step {
  final String title;
  final String description;
  final DynamicForm? jsonForm;
  final String? jsonFormURL;
  Step({
    required this.title,
    required this.description,
    this.jsonForm,
    this.jsonFormURL,
  });
}
