import 'package:openknect_form_generator/frontend/model/dynamic_form_field_validation_model.dart';
import 'package:json/json.dart';

@JsonCodable()
class DynamicFormField {
  final String type;
  final String label;
  final String key;
  final List<String>? options;
  final DynamicFormFieldValidation validations;

  DynamicFormField({
    required this.type,
    required this.label,
    required this.key,
    required this.options,
    required this.validations,
  });
}
