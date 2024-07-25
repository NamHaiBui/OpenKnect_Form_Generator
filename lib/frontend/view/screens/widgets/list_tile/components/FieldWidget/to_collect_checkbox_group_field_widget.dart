import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:openknect_app/app_common/config/screen_sizes/desktop/desktop_typography_config.dart';
import 'package:openknect_form_generator/frontend/layout/mobile_typography_config.dart';
import 'package:openknect_form_generator/frontend/layout/theme_system/data/spacing.dart';
import 'package:openknect_form_generator/frontend/layout/theme_system/data/text_data.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form/dynamic_form_modeling_css.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form/fields/dynamic_form_field_model.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/components/config/form_field_appearance.dart';

class ToCollectCheckboxGroupFieldWidget extends StatelessWidget {
  const ToCollectCheckboxGroupFieldWidget({
    super.key,
    required this.field,
    required this.onSaved,
  });
  final DynamicFormField field;
  final void Function(dynamic value) onSaved;
  @override
  Widget build(BuildContext context) {
    final String formFieldTitle = field.label;
    final String formFieldName = field.text!;
    final List<String> options = field.options!;
    final List<String>? initialValue = field.initialValue;
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
          Text(formFieldTitle, style: mobileTypography.titleSmall),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: FormBuilderCheckboxGroup<String>(
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
                    border: css?.border?.parseInputBorder() ?? InputBorder.none,
                    contentPadding: inputPadding,
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
