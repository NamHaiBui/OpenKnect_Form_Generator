import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:openknect_form_generator/frontend/layout/desktop_typograpy_config.dart';
import 'package:openknect_form_generator/frontend/layout/theme_system/theme_system.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form/dynamic_form_modeling_css.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form/fields/dynamic_form_field_model.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/components/config/form_field_appearance.dart';

class CheckboxFieldWidget extends StatelessWidget {
  const CheckboxFieldWidget({
    super.key,
    required this.field,
    required this.onSaved,
  });
  final DynamicFormField field;
  final void Function(dynamic value) onSaved;
  @override
  Widget build(BuildContext context) {
    final String formFieldName = field.label;
    final String checkboxText = field.text ?? "empty";
    final bool initialValue = field.initialValue == null;
    final String? Function(dynamic) validator = FormBuilderValidators.compose([
      if (field.validations.required)
        FormBuilderValidators.required(errorText: 'Required'),
    ]);
    final DynamicFormCSS? css = field.css;
    return Column(
      children: [
        Padding(
          padding: css?.padding?.toEdgeInsets() ?? paddingBetweenFormFields,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: FormBuilderCheckbox(
                  restorationId: null,
                  onSaved: onSaved,
                  name: formFieldName,
                  initialValue: initialValue,
                  validator: validator,
                  decoration: InputDecoration(
                    border: css?.border?.parseInputBorder() ?? borderNoRadius,
                    enabledBorder: css?.enabledBorder?.parseInputBorder() ??
                        enabledBorderNoRadius,
                    focusedBorder: css?.focusedBorder?.parseInputBorder() ??
                        focusedBorderNoRadius,
                    errorBorder: css?.errorBorder?.parseInputBorder() ??
                        errorBorderNoRadius,
                    errorStyle: hiddenTextStyle,
                  ),
                  title: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: checkboxText,
                          style: css?.inputTextStyle?.toTextStyle() ??
                              desktopTypography.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
