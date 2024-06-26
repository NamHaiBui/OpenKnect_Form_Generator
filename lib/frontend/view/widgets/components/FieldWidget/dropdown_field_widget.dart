import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:openknect_form_generator/constants/svg_for_settings.dart';
import 'package:openknect_form_generator/frontend/layout/theme_system/data/spacing.dart';
import 'package:openknect_form_generator/frontend/layout/theme_system/data/text_data.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form_field_model.dart';
import 'package:openknect_form_generator/frontend/view/widgets/components/FieldWidget/field_name_widget.dart';
import 'package:openknect_form_generator/frontend/view/widgets/components/config/form_field_appearance.dart';

class DropdownFieldWidget extends StatelessWidget {
  const DropdownFieldWidget({super.key, required this.field});
  final DynamicFormField field;
  @override
  Widget build(BuildContext context) {
    final String formFieldName = field.label;
    final String? hintText = field.startHintText;
    final dynamic initialValue = field.initialValue;
    final List<dynamic> items = field.options!;
    final String? Function(dynamic) validator = FormBuilderValidators.compose([
      if (field.validations.required)
        FormBuilderValidators.required(errorText: 'Please make a selection'),
    ]);
    final double height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: paddingBetweenFormFields,
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
              Expanded(
                child: FormBuilderDropdown(
                  name: formFieldName,
                  initialValue: initialValue,
                  items: items
                      .map((value) => DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              style: textTheme.bodyMedium!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ))
                      .toList(),
                  validator: validator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  menuMaxHeight: height * 0.35,
                  borderRadius: borderRadius5,
                  isExpanded: true,
                  icon: SvgPicture.string(SVGForSettings.dropDownArrow),
                  dropdownColor: Colors.white,
                  style: inputTitleTextStyle,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: hintTextStyle,
                    contentPadding: inputPadding,
                    border: borderNoRadius,
                    enabledBorder: enabledBorderNoRadius,
                    focusedBorder: focusedBorderNoRadius,
                    errorBorder: errorBorderNoRadius,
                    errorStyle: hiddenTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
