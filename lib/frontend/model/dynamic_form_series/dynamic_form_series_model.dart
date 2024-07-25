import 'package:json/json.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form/dynamic_form_model.dart';

@JsonCodable()
class DynamicFormSeries {
  final String id;
  final String name;
  final String description;
  List<DynamicForm> forms;

  DynamicFormSeries(
      {required this.id,
      required this.name,
      required this.description,
      required this.forms});
}
