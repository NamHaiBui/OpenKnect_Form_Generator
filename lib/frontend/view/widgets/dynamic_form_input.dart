import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form_field_model.dart';

class DynamicFormInput extends StatelessWidget {
  final DynamicFormField field;

  const DynamicFormInput({
    super.key,
    required this.field,
  });

  @override
  Widget build(BuildContext context) {
    switch (field.type) {
      case 'TextBox':
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: FormBuilderTextField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            name: field.key,
            decoration: InputDecoration(labelText: field.label),
            keyboardType: _getInputType(
              field.validations.numeric,
              field.validations.email,
            ),
            validator: FormBuilderValidators.compose(
              [
                if (field.validations.required)
                  FormBuilderValidators.required(errorText: 'Required'),
                if (field.validations.email != null &&
                    field.validations.email == true)
                  FormBuilderValidators.email(
                      errorText: "A valid email is required"),
                if (field.validations.numeric != null &&
                    field.validations.numeric == true)
                  FormBuilderValidators.numeric(
                      errorText: "A number is required"),
                if (field.validations.minLength != null)
                  FormBuilderValidators.minLength(field.validations.minLength!),
                if (field.validations.maxLength != null)
                  FormBuilderValidators.maxLength(field.validations.maxLength!),
              ],
            ),
          ),
        );

      case 'DropdownList':
        return FormBuilderDropdown(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          name: field.key,
          decoration: InputDecoration(labelText: field.label),
          items: field.options!
              .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem(
                  value: value,
                  child: Text(value),
                ),
              )
              .toList(),
          validator: FormBuilderValidators.compose([
            if (field.validations.required)
              FormBuilderValidators.required(
                  errorText: 'Please make a selection'),
          ]),
        );

      default:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Field Type [${field.type}] does not exist.",
            style: const TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
    }
  }

  TextInputType _getInputType(bool? numeric, bool? email) {
    if (numeric != null && numeric == true) {
      return TextInputType.number;
    }
    if (email != null && email == true) {
      return TextInputType.emailAddress;
    }
    return TextInputType.text;
  }
}
