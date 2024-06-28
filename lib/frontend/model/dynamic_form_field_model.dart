import 'package:openknect_form_generator/frontend/model/dynamic_form_date_field.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form_field_validation_model.dart';
import 'package:json/json.dart';

/// This class represents a dynamic form field.
/// It contains all the information needed to render a form field.
@JsonCodable()
class DynamicFormField {
  /// The type of the form field.
  /// This can be 'TextBox', 'DropdownList', 'CheckBox', 'RadioButton', 'Date', etc.
  final String type;

  /// The text to display in the form field.
  /// This is only used for certain types of form fields, such as 'TextBox'.
  final String? text;

  /// The hint text to display in the form field when it is empty.
  /// This is only used for certain types of form fields, such as 'TextBox'.
  final String? startHintText;

  /// The hint text to display in the form field when it is empty.
  /// This is only used for certain types of form fields, such as 'TextBox'.
  final String? endHintText;

  /// The label to display for the form field.
  final String label;

  /// The initial value of the form field.
  /// This is only used for certain types of form fields, such as 'DropdownList'.
  /// If only one initialValue is needed, the program will take the first (initialValue[0]).
  final List<String>? initialValue;

  /// The key of the form field.
  /// This is used to identify the form field.
  final String key;

  /// The options for the form field.
  /// This is only used for certain types of form fields, such as 'DropdownList'.
  final List<String>? options;

  /// The validations for the form field.
  /// This is used to validate the user input.
  final DynamicFormFieldValidation validations;

  final DynamicFormDateField? date;

  /// Creates a new instance of the DynamicFormField class.

  /// Constructor for the DynamicFormField class.
  DynamicFormField({
    required this.date,
    required this.startHintText,
    required this.endHintText,
    required this.type,
    required this.label,
    required this.initialValue,
    required this.key,
    required this.text,
    required this.options,
    required this.validations,
  });
}
