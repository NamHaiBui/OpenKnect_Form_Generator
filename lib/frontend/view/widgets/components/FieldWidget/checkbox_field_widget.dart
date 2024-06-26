import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:openknect_app/app_common/config/screen_sizes/desktop/desktop_typography_config.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form_field_model.dart';
import 'package:openknect_form_generator/frontend/view/widgets/components/config/form_field_appearance.dart';

class CheckboxFieldWidget extends StatelessWidget {
  const CheckboxFieldWidget({super.key, required this.field});
  final DynamicFormField field;
  @override
  Widget build(BuildContext context) {
    final String formFieldName = field.label;
    final String checkboxText = field.text ?? "empty";
    final bool initialValue = field.initialValue == null;
    validator(p0) {
      return null;
    }

    return Column(
      children: [
        Padding(
          padding: paddingBetweenFormFields,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: FormBuilderCheckbox(
                  name: formFieldName,
                  initialValue: initialValue,
                  validator: validator,
                  // decoration: InputDecoration(
                  //   border: borderNoRadius,
                  //   enabledBorder: enabledBorderNoRadius,
                  //   focusedBorder: focusedBorderNoRadius,
                  //   errorBorder: errorBorderNoRadius,
                  //   errorStyle: hiddenTextStyle,
                  // ),
                  title: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: checkboxText,
                          style: desktopTypography.bodyMedium,
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
