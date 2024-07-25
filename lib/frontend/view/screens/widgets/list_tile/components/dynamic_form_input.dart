import 'package:flutter/material.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form/fields/dynamic_form_field_model.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/components/FieldWidget/address_field_widget.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/components/FieldWidget/checkbox_field_widget.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/components/FieldWidget/checkbox_group_field_widget.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/components/FieldWidget/date_field_widget.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/components/FieldWidget/date_range_field_widget.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/components/FieldWidget/num_range_field_widget.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/components/FieldWidget/radio_group_field_widget.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/components/FieldWidget/text_field_widget.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/components/FieldWidget/to_collect_checkbox_group_field_widget.dart';

import 'FieldWidget/dropdown_field_widget.dart';

class DynamicFormInput extends StatelessWidget {
  final DynamicFormField field;
  final void Function(dynamic) onSaved;
  final void Function(dynamic) onSubmit;

  const DynamicFormInput(
      {super.key,
      required this.field,
      required this.onSaved,
      required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    switch (field.type) {
      case 'textBox':
        return TextFieldWidget(
          field: field,
          onSaved: onSaved,
          onSubmit: onSubmit,
        );
      case 'dropdownList':
        return DropdownFieldWidget(
          field: field,
          onSaved: onSaved,
        );
      case 'checkBox':
        return CheckboxFieldWidget(
          field: field,
          onSaved: onSaved,
        );
      case 'checkboxGroup':
        return CheckboxGroupFieldWidget(
          field: field,
          onSaved: onSaved,
        );
      case 'radioGroup':
        return RadioGroupFieldWidget(
          field: field,
          onSaved: onSaved,
        );
      case 'date':
        return DateFieldWidget(
          field: field,
          onSaved: onSaved,
          onSubmit: onSubmit,
        );
      case 'dateRange':
        return DateRangeFieldWidget(
          field: field,
          onSaved: onSaved,
          onSubmit: onSubmit,
        );
      case 'numRange':
        return NumRangeFieldWidget(
          field: field,
          onSaved: onSaved,
        );
      case 'address':
        return AddressFieldWidget(
          field: field,
          onSaved: onSaved,
          onSubmit: onSubmit,
        );
      case 'toCollectCheckboxGroup':
        return ToCollectCheckboxGroupFieldWidget(
          field: field,
          onSaved: onSaved,
        );
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
