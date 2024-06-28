import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:openknect_form_generator/frontend/layout/theme_system/data/spacing.dart';
import 'package:openknect_form_generator/frontend/layout/theme_system/data/text_data.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form_field_model.dart';
import 'package:openknect_form_generator/frontend/view/widgets/components/FieldWidget/field_name_widget.dart';
import 'package:openknect_form_generator/frontend/view/widgets/components/config/form_field_appearance.dart';

class DateFieldWidget extends StatelessWidget {
  const DateFieldWidget({super.key, required this.field});
  final DynamicFormField field;
  Future<void> selectDate(
      BuildContext context,
      FormFieldState<DateTime?> fieldState,
      DateTime firstDate,
      DateTime lastDate) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null) {
      fieldState.didChange(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final String formFieldName = field.label;
    final String? hintText = field.startHintText;
    final DateTime firstDate = field.date != null
        ? DateTime.parse(field.date!.firstDate ?? "2000-01-01")
        : DateTime.now();
    final DateTime lastDate = field.date != null
        ? DateTime.parse(field.date!.lastDate ?? "2023-12-31")
        : DateTime.now();
    final DateTime? initialValue = DateTime.tryParse(field.initialValue![0]);
    final DateFormat dateFormat =
        field.date != null ? DateFormat(field.date!.dateFormat) : DateFormat();
    final String? Function(dynamic) validator = FormBuilderValidators.compose([
      if (field.validations.required)
        FormBuilderValidators.required(errorText: 'Required'),
    ]);
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
                child: FormBuilderField<DateTime?>(
                  name: formFieldName,
                  initialValue: initialValue,
                  builder: (FormFieldState<DateTime?> fieldState) {
                    return Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () => selectDate(
                                context, fieldState, firstDate, lastDate),
                            child: IgnorePointer(
                              ignoring: true,
                              child: TextFormField(
                                validator: validator,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                readOnly: true,
                                autofocus: false,
                                controller: TextEditingController(
                                  text: fieldState.value != null
                                      ? dateFormat.format(fieldState.value!)
                                      : "",
                                ),
                                style: inputTitleTextStyle,
                                decoration: InputDecoration(
                                  hintText: hintText,
                                  hintStyle: hintTextStyle,
                                  border: borderNoRadius,
                                  enabledBorder: enabledBorderNoRadius,
                                  focusedBorder: focusedBorderNoRadius,
                                  errorBorder: errorBorderNoRadius,
                                  errorStyle: hiddenTextStyle,
                                ),
                              ),
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
