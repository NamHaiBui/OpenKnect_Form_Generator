import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:openknect_form_generator/frontend/layout/desktop_typograpy_config.dart';
import 'package:openknect_form_generator/frontend/layout/theme_system/data/spacing.dart';
import 'package:openknect_form_generator/frontend/layout/theme_system/data/text_data.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form/dynamic_form_modeling_css.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form/fields/dynamic_form_field_model.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/components/FieldWidget/field_name_widget.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/components/config/form_field_appearance.dart';

class CheckboxGroupFieldWidget extends StatelessWidget {
  const CheckboxGroupFieldWidget({
    super.key,
    required this.field,
    required this.onSaved,
  });
  final DynamicFormField field;
  final void Function(dynamic value) onSaved;
  @override
  Widget build(BuildContext context) {
    final String formFieldName = field.label;

    final List<dynamic> options = field.options!;
    final List<bool>? initialValue =
        field.initialValue?.map((e) => e == "true").toList(growable: false);
    final String? Function(dynamic) validator = FormBuilderValidators.compose([
      if (field.validations.required)
        FormBuilderValidators.required(errorText: 'Required'),
    ]);
    final DynamicFormCSS? css = field.css;
    return Padding(
      padding: css?.padding?.toEdgeInsets() ?? paddingBetweenFormFields,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldNameWidget(
            fieldName: formFieldName,
            fontSize: fieldNameSize,
          ),
          spacingBetweenTitleAndField,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: formTextFieldSize.width,
                child: FormBuilderCheckboxGroup<dynamic>(
                  onSaved: onSaved,
                  initialValue: initialValue,
                  name: formFieldName,
                  validator: validator,
                  options: options
                      .map((option) => FormBuilderFieldOption(
                            value: option,
                            child: SizedBox(
                              width: formRadioOptionSize.width,
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: option.toString(),
                                    style: desktopTypography.bodyLarge,
                                  ),
                                ]),
                              ),
                            ),
                          ))
                      .toList(growable: false),
                  decoration: InputDecoration(
                    border: css?.border?.parseInputBorder() ?? borderNoRadius,
                    enabledBorder: css?.enabledBorder?.parseInputBorder() ??
                        enabledBorderNoRadius,
                    focusedBorder: css?.focusedBorder?.parseInputBorder() ??
                        focusedBorderNoRadius,
                    errorBorder: css?.errorBorder?.parseInputBorder() ??
                        errorBorderNoRadius,
                    contentPadding: radioInputPadding,
                    errorStyle: hiddenTextStyle,
                  ),
                  wrapSpacing: formRadioWrapSpacing,
                  controlAffinity: ControlAffinity.leading,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
