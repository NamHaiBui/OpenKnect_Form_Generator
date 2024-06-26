import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:openknect_db_model/freezed_models/common/address/address.dart';
import 'package:openknect_form_generator/frontend/layout/theme_system/data/spacing.dart';
import 'package:openknect_form_generator/frontend/layout/theme_system/data/text_data.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form_field_model.dart';
import 'package:openknect_form_generator/frontend/view/widgets/components/FieldWidget/field_name_widget.dart';
import 'package:openknect_form_generator/frontend/view/widgets/components/config/form_field_appearance.dart';
import 'package:openknect_form_generator/frontend/view/widgets/components/config/form_fields.dart';
import 'package:openknect_form_generator/frontend/view/widgets/components/config/form_input_formatters.dart';
import 'package:openknect_form_generator/frontend/view/widgets/components/config/form_validators.dart';
import 'package:openknect_form_generator/package_initialization.dart';

class AddressFieldWidget extends StatelessWidget {
  const AddressFieldWidget({super.key, required this.field});
  final DynamicFormField field;
  void updateAddressField(
      String? value, FormFieldState<Address> fieldState, String fieldChanged) {
    Address oldFieldValue = fieldState.value!;
    late Address newFieldValue;

    if (fieldChanged == addressFormFields.street) {
      newFieldValue = oldFieldValue.copyWith(street: value);
    } else if (fieldChanged == addressFormFields.district) {
      newFieldValue = oldFieldValue.copyWith(district: value);
    } else if (fieldChanged == addressFormFields.city) {
      newFieldValue = oldFieldValue.copyWith(city: value);
    } else if (fieldChanged == addressFormFields.state) {
      newFieldValue = oldFieldValue.copyWith(state: value ?? "");
    } else if (fieldChanged == addressFormFields.postalCode) {
      newFieldValue = oldFieldValue.copyWith(postalCode: value);
    } else if (fieldChanged == addressFormFields.country) {
      newFieldValue = oldFieldValue.copyWith(country: value ?? "");
    } else {
      return;
    }

    fieldState.didChange(newFieldValue);
  }

  @override
  Widget build(BuildContext context) {
    final String formFieldName = field.label;
    final String? Function(dynamic) validator = FormBuilderValidators.compose([
      if (field.validations.required)
        FormBuilderValidators.required(errorText: 'Required'),
    ]);
    final Address? initialValue = field.initialValue == null
        ? null
        : Address.fromJson(jsonDecode(field.initialValue![0]));
    final List<String> statesList = PackageInitialization.stateList;
    final List<String> countriesList = PackageInitialization.countryList;
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
          FormBuilderField<Address>(
              name: formFieldName,
              initialValue: initialValue ??
                  Address(state: "Unknown", country: "United States"),
              builder: (FormFieldState<Address> fieldState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: formAddressStreetFieldSize.height,
                              width: formAddressStreetFieldSize.width,
                              child: TextFormField(
                                initialValue: initialValue != null
                                    ? initialValue.street
                                    : "",
                                onChanged: (value) => updateAddressField(value,
                                    fieldState, addressFormFields.street),
                                onSaved: (value) => updateAddressField(value,
                                    fieldState, addressFormFields.street),
                                style: inputTitleTextStyle,
                                decoration: InputDecoration(
                                  hintText: addressFormFields.street,
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
                        spacingBetweenAddressFields,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: formAddressDistrictFieldSize.height,
                              width: formAddressDistrictFieldSize.width,
                              child: TextFormField(
                                initialValue: initialValue != null
                                    ? initialValue.district
                                    : "",
                                onChanged: (value) => updateAddressField(value,
                                    fieldState, addressFormFields.district),
                                onSaved: (value) => updateAddressField(value,
                                    fieldState, addressFormFields.district),
                                style: inputTitleTextStyle,
                                decoration: InputDecoration(
                                  hintText: addressFormFields.district,
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
                    spacingBetweenAddressRows,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: formAddressCityFieldSize.height,
                              width: formAddressCityFieldSize.width,
                              child: TextFormField(
                                initialValue: initialValue != null
                                    ? initialValue.city
                                    : "",
                                onChanged: (value) => updateAddressField(
                                    value, fieldState, addressFormFields.city),
                                onSaved: (value) => updateAddressField(
                                    value, fieldState, addressFormFields.city),
                                style: inputTitleTextStyle,
                                decoration: InputDecoration(
                                  hintText: addressFormFields.city,
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
                        spacingBetweenAddressFields,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: formAddressStateFieldSize.height,
                              width: formAddressStateFieldSize.width,
                              child: DropdownButtonFormField(
                                value: initialValue?.state,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: validator,
                                items: statesList
                                    .map((value) => DropdownMenuItem(
                                          value: value,
                                          child: Text(value),
                                        ))
                                    .toList(),
                                focusColor: Colors.transparent,
                                onChanged: (value) => updateAddressField(
                                    value, fieldState, addressFormFields.state),
                                onSaved: (value) => updateAddressField(
                                    value, fieldState, addressFormFields.state),
                                style: inputTitleTextStyle,
                                decoration: InputDecoration(
                                  hintText: addressFormFields.state,
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
                        spacingBetweenAddressFields,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: formAddressCountryFieldSize.height,
                              width: formAddressCountryFieldSize.width,
                              child: DropdownButtonFormField(
                                value: initialValue?.country ?? "United States",
                                validator: validator,
                                items: countriesList
                                    .map((value) => DropdownMenuItem(
                                          value: value,
                                          child: Text(value),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  updateAddressField(value, fieldState,
                                      addressFormFields.country);
                                },
                                onSaved: (value) => updateAddressField(value,
                                    fieldState, addressFormFields.country),
                                style: inputTitleTextStyle,
                                decoration: InputDecoration(
                                  hintText: addressFormFields.country,
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
                        spacingBetweenAddressFields,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: formAddressPostalCodeFieldSize.height,
                              width: formAddressPostalCodeFieldSize.width,
                              child: TextFormField(
                                initialValue: initialValue != null
                                    ? initialValue.postalCode
                                    : "",
                                onChanged: (value) => updateAddressField(value,
                                    fieldState, addressFormFields.postalCode),
                                onSaved: (value) => updateAddressField(value,
                                    fieldState, addressFormFields.postalCode),
                                validator: postalCodeValidator,
                                inputFormatters: [postalCodeFormatter],
                                keyboardType: TextInputType.number,
                                style: inputTitleTextStyle,
                                decoration: InputDecoration(
                                  hintText: addressFormFields.postalCode,
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
                    )
                  ],
                );
              }),
        ],
      ),
    );
  }
}
