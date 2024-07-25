import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:openknect_form_generator/frontend/layout/theme_system/data/spacing.dart';
import 'package:openknect_form_generator/frontend/layout/theme_system/data/text_data.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form/dynamic_form_modeling_css.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form/fields/dynamic_form_field_model.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/components/FieldWidget/field_name_widget.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/components/config/form_field_appearance.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.field,
    required this.onSubmit,
    required this.onSaved,
  });
  final DynamicFormField field;
  final void Function(String? value) onSubmit;
  final void Function(dynamic value) onSaved;
  TextInputType _getInputType(bool? numeric, bool? email) {
    if (numeric != null && numeric == true) {
      return TextInputType.number;
    }
    if (email != null && email == true) {
      return TextInputType.emailAddress;
    }
    return TextInputType.text;
  }

  @override
  Widget build(BuildContext context) {
    final String formFieldName = field.label;
    final String? hintText = field.text;
    final String? initialValue = field.initialValue?[0];
    // final List<TextInputFormatter>? inputFormatters;
    // final TextInputType? keyboardType;
    final String? Function(String?) validator = FormBuilderValidators.compose(
      [
        if (field.validations.required)
          FormBuilderValidators.required(errorText: 'Required'),
        if (field.validations.email != null && field.validations.email == true)
          FormBuilderValidators.email(errorText: "A valid email is required"),
        if (field.validations.numeric != null &&
            field.validations.numeric == true)
          FormBuilderValidators.numeric(errorText: "A number is required"),
        if (field.validations.minLength != null)
          FormBuilderValidators.minLength(field.validations.minLength!),
        if (field.validations.maxLength != null)
          FormBuilderValidators.maxLength(field.validations.maxLength!),
        if (field.validations.numeric != null &&
            field.validations.numeric == true &&
            field.validations.minNumber != null)
          FormBuilderValidators.min(field.validations.minNumber!),
        if (field.validations.numeric != null &&
            field.validations.numeric == true &&
            field.validations.maxNumber != null)
          FormBuilderValidators.max(field.validations.maxNumber!)
      ],
    );
    final DynamicFormCSS? css = field.css;
    
    return Padding(
      padding: css?.padding?.toEdgeInsets() ?? paddingBetweenFormFields,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldNameWidget(
            fieldName: formFieldName,
            fontSize: css?.labelTextStyle?.fontSize.toDouble() ?? fieldNameSize,
          ),
          spacingBetweenTitleAndField,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: FormBuilderTextField(
                onSaved: onSaved,
                onSubmitted: onSubmit,
                name: formFieldName,
                validator: validator,
                initialValue: initialValue,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // inputFormatters: inputFormatters,
                keyboardType: _getInputType(
                  field.validations.numeric,
                  field.validations.email,
                ),
                style: inputTitleTextStyle,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: hintTextStyle,
                  contentPadding: inputPadding,
                  border: css?.border?.parseInputBorder() ?? borderNoRadius,
                  enabledBorder: css?.enabledBorder?.parseInputBorder() ??
                      enabledBorderNoRadius,
                  focusedBorder: css?.focusedBorder?.parseInputBorder() ??
                      focusedBorderNoRadius,
                  errorBorder: css?.errorBorder?.parseInputBorder() ??
                      errorBorderNoRadius,
                  errorStyle: hiddenTextStyle,
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
