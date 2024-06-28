# OpenKnect Form Generator Documentation

## Dynamic Form Generation with JSON

This project provides a flexible and customizable solution for creating dynamic forms in Flutter applications using JSON. The JSON data defines the structure and behavior of the forms, allowing for easy modification and reusability.

## Supported Form Field Types

The following form field types are supported:

- **TextBox:** A simple text input field.
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
  "label": "Text Input", // Label displayed for the field
  "initialValue": ["Initial Text"], // Default value for the field
  "key": "textInput", // Unique identifier for the field
  "text": "Enter text here", // Placeholder text for the field
  "options": [], // Not applicable for TextBox
  "validations": {
    "required": true, // Validation rule: field is required
    "minLength": 5, // Validation rule: minimum length of the input
    "maxLength": 20 // Validation rule: maximum length of the input
  }
}
```

### DropdownList

```json
{
  "type": "dropdownList",
  "label": "Dropdown List", // Label displayed for the field
  "initialValue": ["Option 2"], // Default selected option
  "key": "dropdownList", // Unique identifier for the field
  "options": [
    "Option 1", // List of all available options
    "Option 2",
    "Option 3"
  ],
  "validations": {
    "required": true // Validation rule: field is required
  }
}


```

### CheckBox

```json
{
  "type": "checkBox",
  "label": "Checkbox", // Label displayed for the field
  "initialValue": ["true"], // Default value for the field (true for checked)
  "key": "checkbox", // Unique identifier for the field
  "options": ["Option1"], // Not applicable for CheckBox
  "validations": {
    "required": true // Validation rule: field is required
  }
}


```

### CheckboxGroup

```json
{
  "type": "checkboxGroup",
  "label": "Checkbox Group", // Label displayed for the field
  "initialValue": ["Option 1", "Option 3"], // List of default selected options
  "key": "checkboxGroup", // Unique identifier for the field
  "options": [
    "Option 1", // List of all available options
    "Option 2",
    "Option 3"
  ],
  "validations": {
    "required": true // Validation rule: field is required
  }
}

```

### RadioGroup

```json
{
  "type": "radioGroup",
  "label": "Radio Group", // Label displayed for the field
  "initialValue": ["Option 2"], // Default selected option
  "key": "radioGroup", // Unique identifier for the field
  "options": [
    "Option 1", // List of all available options
    "Option 2",
    "Option 3"
  ],
  "validations": {
    "required": true // Validation rule: field is required
  }
}

```

### Date

```json
{
  "type": "date",
  "label": "Birth Date", // Label displayed for the field
  "name": "birthDate", // Unique identifier for the field
  "key": "date", // Unique identifier for the field
  "date": {
    "dateFormat": "yyyy-MM-dd", // Format of the date
    "firstDate": "2023-12-31", // First selectable date
    "lastDate": "2023-12-31" // Last selectable date
  },
  "initialValue": ["2023-12-25"], // Default selected date
  "validations": {
    "required": true // Validation rule: field is required
  }
}

```

### DateRange

```json
{
  "type": "dateRange",
  "label": "Date Range", // Label displayed for the field
  "date": {
    "dateFormat": "yyyy-MM-dd", // Format of the date
    "firstDate": "2000-01-01", // First selectable date
    "lastDate": "2023-12-31" // Last selectable date
  },
  "initialValue": ["2023-12-25", "2023-12-26"], // Default selected date range
  "key": "dateRange", // Unique identifier for the field
  "options": [], // Not applicable for DateRange
  "validations": {
    "required": true // Validation rule: field is required
  }
}

```

### NumRange

```json
{
  "type": "numRange",
  "label": "Number Range", // Label displayed for the field
  "initialValue": ["10", "50"], // Default selected number range
  "key": "numRange", // Unique identifier for the field
  "options": [], // Not applicable for NumRange
  "validations": {
    "required": true // Validation rule: field is required
  }
}

```

### Address

- Initial Value for Address currently not working due to varies in State and Country listing

```json
{
  "type": "address",
  "label": "Address", // Label displayed for the field
  "initialValue": ["123 Main St", "Carli", "Anytown", "CA", "12345"], // Default address components
  "key": "address", // Unique identifier for the field
  "options": [], // Not applicable for Address
  "validations": {
    "required": true // Validation rule: field is required
  }
}

```

### ToCollectCheckboxGroup

```json
{
  "type": "toCollectCheckboxGroup",
  "label": "To Collect Checkbox Group", // Label displayed for the field
  "text": "Fun", // Text displayed next to the checkbox group
  "initialValue": ["Option 2", "Option 3"], // List of default selected options
  "key": "toCollectCheckboxGroup", // Unique identifier for the field
  "options": [
    "Option 1", // List of all available options
    "Option 2",
    "Option 3"
  ],
  "validations": {
    "required": true // Validation rule: field is required
  }
}

```

### Initial Value Handling

- **Single Initial Value:** For fields with a single initial value, the program will use `initialValue[0]`.
- **Multiple Initial Values:** For fields with multiple initial values, the program will read from `initialValue[0]` and beyond.

## Usage

1. **Define Form Fields in JSON:** Create a JSON file containing the form field definitions.
2. **Load JSON Data:** Load the JSON data into your Flutter application.
3. **Dynamically Create Form Widgets:** Use the JSON data to dynamically create form widgets based on the field types.
4. **Handle Form Submission:** Process the form data when the user submits the form.

## Example Implementation

```dart
// Load JSON data from a file or API
List<Map<String, dynamic>> formFields = ...;

// Create a dynamic form using the JSON data
Form(
  child: Column(
    children: formFields.map((field) {
      // Create a form field widget based on the field type
      switch (field.type) {
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
```

### Future Augmentation: Gemini API Integration

This section outlines a future enhancement to dynamically generate form JSON using the Gemini API.

#### Concept

The application will send a request to the Gemini API, providing a description of the desired form.
Gemini will process the request and generate a JSON file containing the form structure and field definitions.
The application will then load and parse this JSON file to dynamically create the form.

```json
{
  "formName": "My Form", // Name of the form
  "fields": [
    {
      "type": "textBox",
      "label": "Name",
      "initialValue": ["John Doe"],
      "key": "name",
      "validations": {
        "required": true,
        "minLength": 3,
        "maxLength": 20,
        "numeric":false,
        "email":false
      }
    },
    {
      "type": "dropdownList",
      "label": "Country",
      "initialValue": ["US"],
      "key": "country",
      "options": [
        "US",
        "UK",
        "Canada",
        "Australia"
      ],
      "validations": {
        "required": true
      }
    },
    {
      "type": "date",
      "label": "Birth Date",
      "name": "birthDate",
      "key":"date",
      "date": {
        "dateFormat": "yyyy-MM-dd",
        "firstDate": "2023-12-31",
        "lastDate": "2023-12-31"
      },
      "initialValue": ["2023-12-25"],
      "validations": {
        "required": true
      }
    }
  ]
}
```
