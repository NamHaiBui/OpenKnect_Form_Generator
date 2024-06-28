import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:openknect_db_model/freezed_models/common/range/range.dart';
import 'package:openknect_form_generator/frontend/layout/theme_system/data/spacing.dart';
import 'package:openknect_form_generator/frontend/layout/theme_system/data/text_data.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form_field_model.dart';
import 'package:openknect_form_generator/frontend/view/widgets/components/FieldWidget/field_name_widget.dart';
import 'package:openknect_form_generator/frontend/view/widgets/components/config/form_field_appearance.dart';
import 'package:openknect_form_generator/frontend/view/widgets/components/config/form_input_formatters.dart';

class NumRangeFieldWidget extends StatelessWidget {
  const NumRangeFieldWidget({super.key, required this.field});
  final DynamicFormField field;

  void updateFieldRangeStart(String? value, FormFieldState<Range> fieldState) {
    String? valueNumeric = value?.replaceAll(RegExp(r'[^\.\d\s]+'), '');
    double? startRange = double.tryParse(valueNumeric ?? "");
    fieldState.didChange(fieldState.value!.copyWith(startRange: startRange));
  }

  void updateFieldRangeEnd(String? value, FormFieldState<Range> fieldState) {
    String? valueNumeric = value?.replaceAll(RegExp(r'[^\.\d\s]+'), '');
    double? endRange = double.tryParse(valueNumeric ?? "");
    fieldState.didChange(fieldState.value!.copyWith(endRange: endRange));
  }

  @override
  Widget build(BuildContext context) {
    final String formFieldName = field.label;
    final String? startHintText = field.startHintText;
    final String? endHintText = field.endHintText;
    final Range? initialValue = field.initialValue == null
        ? null
        : Range(
            startRange: double.tryParse(field.initialValue![0]),
            endRange: double.tryParse(field.initialValue![1]));
    final bool isDecimal = field.text == null ? false : field.text == "true";
    // final List<TextInputFormatter> inputFormatters;
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
                child: FormBuilderField<Range>(
                  name: formFieldName,
                  initialValue: initialValue ?? Range(),
                  builder: (FormFieldState<Range> fieldState) {
                    return Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            onChanged: (value) =>
                                updateFieldRangeStart(value, fieldState),
                            onSaved: (value) =>
                                updateFieldRangeStart(value, fieldState),
                            initialValue: initialValue != null &&
                                    initialValue.startRange != null
                                ? initialValue.startRange.toString()
                                : "",
                            inputFormatters: [
                              numericFormatter,
                              // ...inputFormatters
                            ],
                            validator: FormBuilderValidators.compose([
                              (value) {
                                if (value != null &&
                                    fieldState.value != null &&
                                    fieldState.value!.endRange != null &&
                                    (double.tryParse(value.replaceAll(
                                                RegExp(r'[^\.\d\s]+'), '')) ??
                                            0) >
                                        fieldState.value!.endRange!) {
                                  return 'Start range must be less than end range.';
                                }
                                return null;
                              },
                            ]),
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: isDecimal),
                            style: inputTitleTextStyle,
                            decoration: InputDecoration(
                              hintText: startHintText,
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
                        spacingBetweenRangeFields,
                        Expanded(
                          child: TextFormField(
                            onChanged: (value) =>
                                updateFieldRangeEnd(value, fieldState),
                            onSaved: (value) =>
                                updateFieldRangeEnd(value, fieldState),
                            initialValue: initialValue != null &&
                                    initialValue.endRange != null
                                ? initialValue.endRange.toString()
                                : "",
                            inputFormatters: [
                              numericFormatter,
                              // ...inputFormatters
                            ],
                            validator: FormBuilderValidators.compose([
                              (value) {
                                if (value != null &&
                                    fieldState.value != null &&
                                    fieldState.value!.startRange != null &&
                                    (double.tryParse(value.replaceAll(
                                                RegExp(r'[^\.\d\s]+'), '')) ??
                                            0) <
                                        fieldState.value!.startRange!) {
                                  return 'End range must be less than start range.';
                                }
                                return null;
                              },
                            ]),
                            style: inputTitleTextStyle,
                            decoration: InputDecoration(
                              hintText: endHintText,
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
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
