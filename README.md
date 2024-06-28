# OpenKnect Form Generator Documentation

## Dynamic Form Generation with JSON

This project provides a flexible and customizable solution for creating dynamic forms in Flutter applications using JSON. The JSON data defines the structure and behavior of the forms, allowing for easy modification and reusability.

## Supported Form Field Types

The following form field types are supported:

- **TextBox:**  A simple text input field.
- **DropdownList:** A dropdown menu for selecting from a list of options.
- **CheckBox:** A single checkbox for selecting a boolean value.
- **CheckboxGroup:** A group of checkboxes for selecting multiple options.
- **RadioGroup:** A group of radio buttons for selecting a single option.
- **Date:** A date picker for selecting a single date.
- **DateRange:** A date range picker for selecting a range of dates.
- **NumRange:** A numeric range picker for selecting a range of numbers.
- **Address:** A specialized field for entering an address with country, state, city, postal code, and street information.
- **ToCollectCheckboxGroup:** A group of checkboxes for selecting multiple options, where each option represents a value to be collected.

## Example JSON Structure

Here are examples of how to define each form field type in JSON, including validation requirements:

### TextBox

```json
{
  "type": "textBox",
  "label": "Name",
  "name": "name",
  "initialValue": "John Doe",
  "validations": {
    "required": true
  }
}
DropdownList
{
  "type": "dropdownList",
  "label": "Country",
  "name": "country",
  "initialValue": "US",
  "options": [
    "US",
    "UK",
    "Canada",
    "Australia"
  ],
  "validations": {
    "required": true
  }
}
CheckBox
{
  "type": "checkBox",
  "label": "Agree to Terms",
  "name": "terms",
  "initialValue": true,
  "validations": {
    "required": true
  }
}
CheckboxGroup
{
  "type": "checkboxGroup",
  "label": "Interests",
  "name": "interests",
  "initialValue": [
    "Sports",
    "Music"
  ],
  "options": [
    "Sports",
    "Music",
    "Movies",
    "Books"
  ],
  "validations": {
    "required": true
  }
}
RadioGroup
{
  "type": "radioGroup",
  "label": "Gender",
  "name": "gender",
  "initialValue": "Male",
  "options": [
    "Male",
    "Female",
    "Other"
  ],
  "validations": {
    "required": true
  }
}
Date
{
  "type": "date",
  "label": "Birth Date",
  "name": "birthDate",
  "initialValue": "2000-01-01",
  "validations": {
    "required": true
  }
}
DateRange
{
  "type": "dateRange",
  "label": "Travel Dates",
  "name": "travelDates",
  "initialValue": [
    "2023-12-25",
    "2024-01-01"
  ],
  "validations": {
    "required": true
  }
}
NumRange
{
  "type": "numRange",
  "label": "Age Range",
  "name": "ageRange",
  "initialValue": [
    18,
    65
  ],
  "validations": {
    "required": true
  }
}
Address
{
  "type": "address",
  "label": "Address",
  "name": "address",
  "initialValue": [
    "123 Main Street",
    "Anytown",
    "CA",
    "91234",
    "United States"
  ],
  "validations": {
    "required": true
  }
}
ToCollectCheckboxGroup
{
  "type": "toCollectCheckboxGroup",
  "label": "Items to Collect",
  "name": "itemsToCollect",
  "initialValue": [
    "Milk",
    "Eggs"
  ],
  "options": [
    "Milk",
    "Eggs",
    "Bread",
    "Cheese"
  ],
  "validations": {
    "required": true
  }
}
Initial Value Handling
Single Initial Value: For fields with a single initial value, the program will use initialValue[0].
Multiple Initial Values: For fields with multiple initial values, the program will read from initialValue[0] and beyond.
Usage
Define Form Fields in JSON: Create a JSON file containing the form field definitions.
Load JSON Data: Load the JSON data into your Flutter application.
Dynamically Create Form Widgets: Use the JSON data to dynamically create form widgets based on the field types.
Handle Form Submission: Process the form data when the user submits the form.
Example Implementation
// Load JSON data from a file or API
List<Map<String, dynamic>> formFields = ...;

// Create a dynamic form using the JSON data
Form(
  child: Column(
    children: formFields.map((field) {
      // Create a form field widget based on the field type
      switch (field['type']) {
        case 'textBox':
          return TextFieldWidget(field: field);
        case 'dropdownList':
          return DropdownListWidget(field: field);
        case 'checkBox':
          return CheckboxFieldWidget(field: field);
        // ... other field types
        default:
          return Container();
      }
    }).toList(),
  ),
);
Conclusion
This project provides a powerful and flexible solution for creating dynamic forms in Flutter applications. It simplifies form development, enhances maintainability, and enables data-driven form creation.

Rate this answer: 
Context Sources (1 file)
Concatenate the provided markdown in a single file

# OpenKnect Form Generator Documentation

## Dynamic Form Generation with JSON

This project provides a flexible and customizable solution for creating dynamic forms in Flutter applications using JSON. The JSON data defines the structure and behavior of the forms, allowing for easy modification and reusability.

## Supported Form Field Types

The following form field types are supported:

- **TextBox:**  A simple text input field.
- **DropdownList:** A dropdown menu for selecting from a list of options.
- **CheckBox:** A single checkbox for selecting a boolean value.
- **CheckboxGroup:** A group of checkboxes for selecting multiple options.
- **RadioGroup:** A group of radio buttons for selecting a single option.
- **Date:** A date picker for selecting a single date.
- **DateRange:** A date range picker for selecting a range of dates.
- **NumRange:** A numeric range picker for selecting a range of numbers.
- **Address:** A specialized field for entering an address with country, state, city, postal code, and street information.
- **ToCollectCheckboxGroup:** A group of checkboxes for selecting multiple options, where each option represents a value to be collected.

## Example JSON Structure

Here are examples of how to define each form field type in JSON, including validation requirements:

### TextBox

```json
{
  "type": "textBox",
  "label": "Name",
  "name": "name",
  "initialValue": "John Doe",
  "validations": {
    "required": true
  }
}
DropdownList
{
  "type": "dropdownList",
  "label": "Country",
  "name": "country",
  "initialValue": "US",
  "options": [
    "US",
    "UK",
    "Canada",
    "Australia"
  ],
  "validations": {
    "required": true
  }
}
CheckBox
{
  "type": "checkBox",
  "label": "Agree to Terms",
  "name": "terms",
  "initialValue": true,
  "validations": {
    "required": true
  }
}
CheckboxGroup
{
  "type": "checkboxGroup",
  "label": "Interests",
  "name": "interests",
  "initialValue": [
    "Sports",
    "Music"
  ],
  "options": [
    "Sports",
    "Music",
    "Movies",
    "Books"
  ],
  "validations": {
    "required": true
  }
}
RadioGroup
{
  "type": "radioGroup",
  "label": "Gender",
  "name": "gender",
  "initialValue": "Male",
  "options": [
    "Male",
    "Female",
    "Other"
  ],
  "validations": {
    "required": true
  }
}
Date
{
  "type": "date",
  "label": "Birth Date",
  "name": "birthDate",
  "initialValue": "2000-01-01",
  "validations": {
    "required": true
  }
}
DateRange
{
  "type": "dateRange",
  "label": "Travel Dates",
  "name": "travelDates",
  "initialValue": [
    "2023-12-25",
    "2024-01-01"
  ],
  "validations": {
    "required": true
  }
}
NumRange
{
  "type": "numRange",
  "label": "Age Range",
  "name": "ageRange",
  "initialValue": [
    18,
    65
  ],
  "validations": {
    "required": true
  }
}
Address
{
  "type": "address",
  "label": "Address",
  "name": "address",
  "initialValue": [
    "123 Main Street",
    "Anytown",
    "CA",
    "91234",
    "United States"
  ],
  "validations": {
    "required": true
  }
}
ToCollectCheckboxGroup
{
  "type": "toCollectCheckboxGroup",
  "label": "Items to Collect",
  "name": "itemsToCollect",
  "initialValue": [
    "Milk",
    "Eggs"
  ],
  "options": [
    "Milk",
    "Eggs",
    "Bread",
    "Cheese"
  ],
  "validations": {
    "required": true
  }
}
Initial Value Handling
Single Initial Value: For fields with a single initial value, the program will use initialValue[0].
Multiple Initial Values: For fields with multiple initial values, the program will read from initialValue[0] and beyond.
Usage
Define Form Fields in JSON: Create a JSON file containing the form field definitions.
Load JSON Data: Load the JSON data into your Flutter application.
Dynamically Create Form Widgets: Use the JSON data to dynamically create form widgets based on the field types.
Handle Form Submission: Process the form data when the user submits the form.
Example Implementation
// Load JSON data from a file or API
List<Map<String, dynamic>> formFields = ...;

// Create a dynamic form using the JSON data
Form(
  child: Column(
    children: formFields.map((field) {
      // Create a form field widget based on the field type
      switch (field['type']) {
        case 'textBox':
          return TextFieldWidget(field: field);
        case 'dropdownList':
          return DropdownListWidget(field: field);
        case 'checkBox':
          return CheckboxFieldWidget(field: field);
        // ... other field types
        default:
          return Container();
      }
    }).toList(),
  ),
);
Conclusion
This project provides a powerful and flexible solution for creating dynamic forms in Flutter applications. It simplifies form development, enhances maintainability, and enables data-driven form creation.

import 'package:openknect_form_generator/frontend/model/dynamic_form_date_field.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form_field_validation_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dynamic_form_field_model.g.dart';

/// This class represents a dynamic form field.
/// It contains all the information needed to render a form field.
@JsonSerializable()
class DynamicFormField {
  /// The type of the form field.
  /// This can be 'TextBox', 'DropdownList', 'CheckBox', 'RadioButton', 'Date', etc.
  final String type;

  /// The text to display in the form field.
  /// This is only used for certain types of form fields, such as 'TextBox'.
  final String? text;

  /// The hint text to display in the form field when it is empty.
  /// This is only used for certain types of form fields, such as 'TextBox'.
  final String? startHintText;

  /// The hint text to display in the form field when it is empty.
  /// This is only used for certain types of form fields, such as 'TextBox'.
  final String? endHintText;

  /// The label to display for the form field.
  final String label;

  /// The initial value of the form field.
  /// This is only used for certain types of form fields, such as 'DropdownList'.
  /// If only one initialValue is needed, the program will take the first (initialValue[0]).
  final List<String>? initialValue;

  /// The key of the form field.
  /// This is used to identify the form field.
  final String key;

  /// The options for the form field.
  /// This is only used for certain types of form fields, such as 'DropdownList'.
  final List<String>? options;

  /// The validations for the form field.
  /// This is used to validate the user input.
  final DynamicFormFieldValidation validations;

  final DynamicFormDateField? date;

  /// Creates a new instance of the DynamicFormField class.

  /// Constructor for the DynamicFormField class.
  DynamicFormField({
    required this.date,
    required this.startHintText,
    required this.endHintText,
    required this.type,
    required this.label,
    required this.initialValue,
    required this.key,
    required this.text,
    required this.options,
    required this.validations,
  });

  factory DynamicFormField.fromJson(Map<String, dynamic> json) =>
      _$DynamicFormFieldFromJson(json);

  Map<String, dynamic> toJson() => _$DynamicFormFieldToJson(this);
}
Explanation of Changes:

Import json_annotation:

Added import 'package:json_annotation/json_annotation.dart'; to use the json_annotation package for serialization and deserialization.
@JsonSerializable() Annotation:

Added @JsonSerializable() annotation to the DynamicFormField class to indicate that it should be serializable.
part 'dynamic_form_field_model.g.dart';:

Added this line to include the generated code for serialization and deserialization.
factory DynamicFormField.fromJson(Map<String, dynamic> json):

Added a factory constructor fromJson to create a DynamicFormField object from a JSON map.
Map<String, dynamic> toJson():

Added a toJson method to convert a DynamicFormField object to a JSON map.
Generating the Code:

Run flutter pub run build_runner build: This command will generate the dynamic_form_field_model.g.dart file containing the code for serialization and deserialization.
Using the Code:

Now you can easily serialize and deserialize DynamicFormField objects using the generated code:

// Serialization
Map<String, dynamic> json = dynamicFormField.toJson();

// Deserialization
DynamicFormField dynamicFormField = DynamicFormField.fromJson(json);
Important Note:

Make sure to run flutter pub run build_runner build after making changes to the DynamicFormField class to regenerate the dynamic_form_field_model.g.dart file.
The json_annotation package provides a convenient way to handle serialization and deserialization in Dart. It automatically generates the necessary code based on the annotations you provide.
# OpenKnect Form Generator Documentation

## Dynamic Form Generation with JSON

This project provides a flexible and customizable solution for creating dynamic forms in Flutter applications using JSON. The JSON data defines the structure and behavior of the forms, allowing for easy modification and reusability.

## Supported Form Field Types

The following form field types are supported:

- **TextBox:**  A simple text input field.
- **DropdownList:** A dropdown menu for selecting from a list of options.
- **CheckBox:** A single checkbox for selecting a boolean value.
- **CheckboxGroup:** A group of checkboxes for selecting multiple options.
- **RadioGroup:** A group of radio buttons for selecting a single option.
- **Date:** A date picker for selecting a single date.
- **DateRange:** A date range picker for selecting a range of dates.
- **NumRange:** A numeric range picker for selecting a range of numbers.
- **Address:** A specialized field for entering an address with country, state, city, postal code, and street information.
- **ToCollectCheckboxGroup:** A group of checkboxes for selecting multiple options, where each option represents a value to be collected.

## Example JSON Structure

Here are examples of how to define each form field type in JSON, including validation requirements:

### TextBox

```json
{
  "type": "textBox",
  "label": "Name",
  "name": "name",
  "initialValue": "John Doe",
  "validations": {
    "required": true
  }
}
DropdownList
{
  "type": "dropdownList",
  "label": "Country",
  "name": "country",
  "initialValue": "US",
  "options": [
    "US",
    "UK",
    "Canada",
    "Australia"
  ],
  "validations": {
    "required": true
  }
}
CheckBox
{
  "type": "checkBox",
  "label": "Agree to Terms",
  "name": "terms",
  "initialValue": true,
  "validations": {
    "required": true
  }
}
CheckboxGroup
{
  "type": "checkboxGroup",
  "label": "Interests",
  "name": "interests",
  "initialValue": [
    "Sports",
    "Music"
  ],
  "options": [
    "Sports",
    "Music",
    "Movies",
    "Books"
  ],
  "validations": {
    "required": true
  }
}
RadioGroup
{
  "type": "radioGroup",
  "label": "Gender",
  "name": "gender",
  "initialValue": "Male",
  "options": [
    "Male",
    "Female",
    "Other"
  ],
  "validations": {
    "required": true
  }
}
Date
{
  "type": "date",
  "label": "Birth Date",
  "name": "birthDate",
  "initialValue": "2000-01-01",
  "validations": {
    "required": true
  }
}
DateRange
{
  "type": "dateRange",
  "label": "Travel Dates",
  "name": "travelDates",
  "initialValue": [
    "2023-12-25",
    "2024-01-01"
  ],
  "validations": {
    "required": true
  }
}
NumRange
{
  "type": "numRange",
  "label": "Age Range",
  "name": "ageRange",
  "initialValue": [
    18,
    65
  ],
  "validations": {
    "required": true
  }
}
Address
{
  "type": "address",
  "label": "Address",
  "name": "address",
  "initialValue": [
    "123 Main Street",
    "Anytown",
    "CA",
    "91234",
    "United States"
  ],
  "validations": {
    "required": true
  }
}
ToCollectCheckboxGroup
{
  "type": "toCollectCheckboxGroup",
  "label": "Items to Collect",
  "name": "itemsToCollect",
  "initialValue": [
    "Milk",
    "Eggs"
  ],
  "options": [
    "Milk",
    "Eggs",
    "Bread",
    "Cheese"
  ],
  "validations": {
    "required": true
  }
}
Initial Value Handling
Single Initial Value: For fields with a single initial value, the program will use initialValue[0].
Multiple Initial Values: For fields with multiple initial values, the program will read from initialValue[0] and beyond.
Usage
Define Form Fields in JSON: Create a JSON file containing the form field definitions.
Load JSON Data: Load the JSON data into your Flutter application.
Dynamically Create Form Widgets: Use the JSON data to dynamically create form widgets based on the field types.
Handle Form Submission: Process the form data when the user submits the form.
Example Implementation
// Load JSON data from a file or API
List<Map<String, dynamic>> formFields = ...;

// Create a dynamic form using the JSON data
Form(
  child: Column(
    children: formFields.map((field) {
      // Create a form field widget based on the field type
      switch (field['type']) {
        case 'textBox':
          return TextFieldWidget(field: field);
        case 'dropdownList':
          return DropdownListWidget(field: field);
        case 'checkBox':
          return CheckboxFieldWidget(field: field);
        // ... other field types
        default:
          return Container();
      }
    }).toList(),
  ),
);
Conclusion
This project provides a powerful and flexible solution for creating dynamic forms in Flutter applications. It simplifies form development, enhances maintainability, and enables data-driven form creation.
