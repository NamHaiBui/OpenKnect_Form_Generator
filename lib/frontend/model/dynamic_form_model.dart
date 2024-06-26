import 'package:json/json.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form_field_model.dart';


@JsonCodable()
class DynamicForm {
  final int id;
  final String name;
  final List<DynamicFormField> fields;

  DynamicForm({
    required this.id,
    required this.name,
    required this.fields,
  });

}
