import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:openknect_db_model/freezed_models/common/time_period/time_period.dart';
import 'package:openknect_db_model/freezed_models/extensions/date_time_range/date_time_range_extensions.dart';
import 'package:openknect_form_generator/frontend/layout/theme_system/data/spacing.dart';
import 'package:openknect_form_generator/frontend/layout/theme_system/data/text_data.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form/dynamic_form_modeling_css.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form/fields/dynamic_form_field_model.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/components/FieldWidget/field_name_widget.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/components/config/form_field_appearance.dart';

class DateRangeFieldWidget extends StatelessWidget {
  const DateRangeFieldWidget({
    super.key,
    required this.field,
    required this.onSubmit,
    required this.onSaved,
  });
  final DynamicFormField field;
  final void Function(String? value) onSubmit;
  final void Function(dynamic value) onSaved;
  Future<void> selectDate(
      BuildContext context,
      FormFieldState<TimePeriod?> fieldState,
      DateTime firstDate,
      DateTime lastDate) async {
    DateTimeRange? pickedDate = await showDateRangePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null) {
      fieldState.didChange(pickedDate.toTimePeriod());
    }
  }

  @override
  Widget build(BuildContext context) {
    final String formFieldName = field.label;
    final String? startHintText = field.startHintText;
    final String? endHintText = field.endHintText;
    final DateTime firstDate = field.date != null
        ? DateTime.parse(field.date!.firstDate ?? DateTime.now().toString())
        : DateTime.now();
    final DateTime lastDate = field.date != null
        ? DateTime.parse(field.date!.lastDate ?? "2000-01-01")
        : DateTime.now();
    final String? Function(dynamic) validator = FormBuilderValidators.compose([
      if (field.validations.required)
        FormBuilderValidators.required(errorText: 'Required'),
    ]);
    final TimePeriod? initialValue = field.initialValue == null
        ? null
        : TimePeriod(
            startDateTime: DateTime.parse(field.initialValue![0]),
            endDateTime: DateTime.parse(field.initialValue![1]));
    final DateFormat dateFormat =
        field.date != null ? DateFormat(field.date!.dateFormat) : DateFormat();
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
              Expanded(
                child: FormBuilderField<TimePeriod?>(
                  onSaved: onSaved,
                  name: formFieldName,
                  initialValue: initialValue,
                  builder: (FormFieldState<TimePeriod?> fieldState) {
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
                                      ? dateFormat.format(
                                          fieldState.value!.startDateTime!)
                                      : "",
                                ),
                                style: inputTitleTextStyle,
                                decoration: InputDecoration(
                                  hintText: startHintText,
                                  hintStyle: hintTextStyle,
                                  errorStyle: hiddenTextStyle,
                                  border: css?.border?.parseInputBorder() ??
                                      borderNoRadius,
                                  enabledBorder:
                                      css?.enabledBorder?.parseInputBorder() ??
                                          enabledBorderNoRadius,
                                  focusedBorder:
                                      css?.focusedBorder?.parseInputBorder() ??
                                          focusedBorderNoRadius,
                                  errorBorder:
                                      css?.errorBorder?.parseInputBorder() ??
                                          errorBorderNoRadius,
                                ),
                              ),
                            ),
                          ),
                        ),
                        spacingBetweenRangeFields,
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
                                      ? dateFormat.format(
                                          fieldState.value!.endDateTime!)
                                      : "",
                                ),
                                style: inputTitleTextStyle,
                                decoration: InputDecoration(
                                  hintText: endHintText,
                                  hintStyle: hintTextStyle,
                                  errorStyle: hiddenTextStyle,
                                  border: css?.border?.parseInputBorder() ??
                                      borderNoRadius,
                                  enabledBorder:
                                      css?.enabledBorder?.parseInputBorder() ??
                                          enabledBorderNoRadius,
                                  focusedBorder:
                                      css?.focusedBorder?.parseInputBorder() ??
                                          focusedBorderNoRadius,
                                  errorBorder:
                                      css?.errorBorder?.parseInputBorder() ??
                                          errorBorderNoRadius,
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
