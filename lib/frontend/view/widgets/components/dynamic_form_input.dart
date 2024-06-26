import 'package:flutter/material.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form_field_model.dart';
import 'package:openknect_form_generator/frontend/view/widgets/components/FieldWidget/address_field_widget.dart';
import 'package:openknect_form_generator/frontend/view/widgets/components/FieldWidget/checkbox_field_widget.dart';
import 'package:openknect_form_generator/frontend/view/widgets/components/FieldWidget/checkbox_group_field_widget.dart';
import 'package:openknect_form_generator/frontend/view/widgets/components/FieldWidget/date_field_widget.dart';
import 'package:openknect_form_generator/frontend/view/widgets/components/FieldWidget/date_range_field_widget.dart';
import 'package:openknect_form_generator/frontend/view/widgets/components/FieldWidget/num_range_field_widget.dart';
import 'package:openknect_form_generator/frontend/view/widgets/components/FieldWidget/radio_group_field_widget.dart';
import 'package:openknect_form_generator/frontend/view/widgets/components/FieldWidget/text_field_widget.dart';
import 'package:openknect_form_generator/frontend/view/widgets/components/FieldWidget/to_collect_checkbox_group_field_widget.dart';

import 'FieldWidget/dropdown_field_widget.dart';

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
        return TextFieldWidget(field: field);
      case 'DropdownList':
        return DropdownFieldWidget(field: field);
      case 'CheckBox':
        return CheckboxFieldWidget(field: field);
      case 'CheckboxGroup':
        return CheckboxGroupFieldWidget(field: field);
      case 'RadioGroup':
        return RadioGroupFieldWidget(field: field);
      case 'Date':
        return DateFieldWidget(field: field);
      case 'DateRange':
        return DateRangeFieldWidget(field: field);
      case 'NumRange':
        return NumRangeFieldWidget(field: field);
      case 'Address':
        return AddressFieldWidget(field: field);
      case 'ToCollectCheckboxGroup':
        return ToCollectCheckboxGroupFieldWidget(field: field);
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
}
