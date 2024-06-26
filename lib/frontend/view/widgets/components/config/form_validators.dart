import 'package:form_builder_validators/form_builder_validators.dart';

final String? Function(dynamic) noValidator = (value) => null;
final String? Function(dynamic) isRequiredValidator = FormBuilderValidators.required();
final String? Function(String?) numbersOnlyValidator = FormBuilderValidators.numeric();
final String? Function(String?) postalCodeValidator = FormBuilderValidators.compose([
  FormBuilderValidators.numeric(),
  FormBuilderValidators.maxLength(5),
]);
