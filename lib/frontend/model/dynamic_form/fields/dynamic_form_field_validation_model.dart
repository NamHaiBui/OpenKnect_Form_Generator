import 'package:json/json.dart';

@JsonCodable()
class DynamicFormFieldValidation {
  final bool required;
  final int? minLength;
  final int? maxLength;
  final int? minNumber;
  final int? maxNumber;
  final bool? email;
  final bool? numeric;

  DynamicFormFieldValidation({
    required this.required,
    this.minLength,
    this.maxLength,
    this.email,
    this.numeric,
    this.minNumber,
    this.maxNumber,
  });
}
