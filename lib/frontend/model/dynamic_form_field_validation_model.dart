import 'package:json/json.dart';

@JsonCodable()
class DynamicFormFieldValidation {
  final bool required;
  final int? minLength;
  final int? maxLength;
  final bool? email;
  final bool? numeric;

  DynamicFormFieldValidation({
    required this.required,
    required this.minLength,
    required this.maxLength,
    required this.email,
    required this.numeric,
  });

}
