# OpenKnect Form Generator

OpenKnect Form Generator is a powerful Flutter package that enables dynamic creation of forms using JSON data and AI-powered form generation. It features real-time form preview and editing capabilities, making it an ideal solution for developers who need to create complex, customizable forms quickly and efficiently.

## Features

- Dynamic form generation from JSON
- Real-time JSON editing and form preview
- AI-powered form creation using Gemini API
- Support for various form field types
- JSON linting and pretty-printing
- Integration with Firebase Messaging
- Country and state data support for address fields

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  openknect_form_generator: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## Usage

### Initializing the Form Generator

First, initialize the package with your API key:

```dart
import 'package:openknect_form_generator/package_initialization.dart';

await FormPackageInitialization.initialize(apiKey: 'YOUR_API_KEY');
```

This initialization process sets up the Gemini API for AI-powered form generation and loads country and state data for address fields.

### Dynamic Live Form Creation

One of the key features of OpenKnect Form Generator is its ability to translate JSON input into a dynamic form in real-time. This is achieved through the combination of the `EditingBox` and `FormCreationWidget` components.

1. **EditingBox**: This widget provides a text area for editing JSON with built-in linting and pretty-printing capabilities. As you type or modify the JSON, it automatically formats and validates the input.

```dart
EditingBox(
  textPromptController: _controller,
  onSaved: (value) {
    // Handle saved value and trigger form update
  },
  showModal: () {
    // Show modal logic
  },
  onError: (error) {
    // Handle JSON parsing error
  },
)
```

2. **FormCreationWidget**: This widget renders the dynamic form based on the JSON input. It updates in real-time as the JSON in the `EditingBox` changes.

```dart
FormCreationWidget(
  processBar: YourProcessBarWidget(),
)
```

The `FormCreationWidget` uses the `PlaygroundWidget` internally to render the form fields based on the current JSON input. As you edit the JSON in the `EditingBox`, the `FormCreationWidget` automatically updates to reflect these changes, providing an immediate visual representation of your form.

This real-time translation from JSON to a live, interactive form allows for rapid prototyping and iteration of form designs, significantly speeding up the development process.

### Generating a Form from JSON

Use the `DynamicFormService` to parse JSON and create a `FormBuilder`:

```dart
import 'package:openknect_form_generator/frontend/service/form_builder_service.dart';

String jsonString = '...'; // Your JSON string
FormBuilder? formBuilder = await DynamicFormService.parseJson(jsonString);

if (formBuilder != null) {
  // Use the formBuilder in your widget tree
}
```

### AI-Powered Form Generation

Use the `GeminiInitializer` to generate forms using AI:

```dart
import 'package:openknect_form_generator/gemini_initialization.dart';

String prompt = "Create a form for a job application";
var response = await GeminiInitializer.call(prompt);
// Process the response to get the generated form JSON
```

## Supported Form Field Types

The following form field types are supported:

- TextBox
- DropdownList
- CheckBox
- CheckboxGroup
- RadioGroup
- Date
- DateRange
- NumRange
- Address
- ToCollectCheckboxGroup

## JSON Structure for Form Fields

Here are examples of how to define each form field type in JSON, including validation requirements:

### TextBox

```json
{
  "type": "textBox",
  "label": "Text Input",
  "initialValue": ["Initial Text"],
  "key": "textInput",
  "text": "Enter text here",
  "options": [],
  "validations": {
    "required": true,
    "minLength": 5,
    "maxLength": 20
  }
}
```

### DropdownList

```json
{
  "type": "dropdownList",
  "label": "Dropdown List",
  "initialValue": ["Option 2"],
  "key": "dropdownList",
  "options": [
    "Option 1",
    "Option 2",
    "Option 3"
  ],
  "validations": {
    "required": true
  }
}
```

### CheckBox

```json
{
  "type": "checkBox",
  "label": "Checkbox",
  "initialValue": ["true"],
  "key": "checkbox",
  "options": ["Option1"],
  "validations": {
    "required": true
  }
}
```

### CheckboxGroup

```json
{
  "type": "checkboxGroup",
  "label": "Checkbox Group",
  "initialValue": ["Option 1", "Option 3"],
  "key": "checkboxGroup",
  "options": [
    "Option 1",
    "Option 2",
    "Option 3"
  ],
  "validations": {
    "required": true
  }
}
```

### RadioGroup

```json
{
  "type": "radioGroup",
  "label": "Radio Group",
  "initialValue": ["Option 2"],
  "key": "radioGroup",
  "options": [
    "Option 1",
    "Option 2",
    "Option 3"
  ],
  "validations": {
    "required": true
  }
}
```

### Date

```json
{
  "type": "date",
  "label": "Birth Date",
  "name": "birthDate",
  "key": "date",
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
```

### DateRange

```json
{
  "type": "dateRange",
  "label": "Date Range",
  "date": {
    "dateFormat": "yyyy-MM-dd",
    "firstDate": "2000-01-01",
    "lastDate": "2023-12-31"
  },
  "initialValue": ["2023-12-25", "2023-12-26"],
  "key": "dateRange",
  "options": [],
  "validations": {
    "required": true
  }
}
```

### NumRange

```json
{
  "type": "numRange",
  "label": "Number Range",
  "initialValue": ["10", "50"],
  "key": "numRange",
  "options": [],
  "validations": {
    "required": true
  }
}
```

### Address

```json
{
  "type": "address",
  "label": "Address",
  "initialValue": ["123 Main St", "Carli", "Anytown", "CA", "12345"],
  "key": "address",
  "options": [],
  "validations": {
    "required": true
  }
}
```

Note: Initial Value for Address currently not working due to variations in State and Country listing.

### ToCollectCheckboxGroup

```json
{
  "type": "toCollectCheckboxGroup",
  "label": "To Collect Checkbox Group",
  "text": "Fun",
  "initialValue": ["Option 2", "Option 3"],
  "key": "toCollectCheckboxGroup",
  "options": [
    "Option 1",
    "Option 2",
    "Option 3"
  ],
  "validations": {
    "required": true
  }
}
```

### Initial Value Handling

- **Single Initial Value:** For fields with a single initial value, the program will use `initialValue[0]`.
- **Multiple Initial Values:** For fields with multiple initial values, the program will read from `initialValue[0]` and beyond.

## Key Components

### DynamicFormInput

The `DynamicFormInput` widget is the core component for rendering various form field types based on the parsed JSON data.

```dart
DynamicFormInput(
  field: field,
  onSaved: (value) {},
  onSubmit: (value) {},
)
```

### StatusExpandableListTile

This widget creates an expandable list tile that shows the current status of a multi-step form process.

```dart
StatusExpandableListTile(
  steps: steps,
  currentStep: currentStep,
  maxDotSize: maxDotSize,
  isInConsideration: true,
  isExample: false,
)
```

### ApplicationStatusTrackerWidget

A higher-level widget that wraps the `StatusExpandableListTile` and provides a visual representation of the application process steps.

```dart
ApplicationStatusTrackerWidget(
  currentStep: currentStep,
  steps: ['Applied', 'Screen', 'Interview', 'Offer'],
  isExample: false,
)
```

## Admin and Recipient Screens

### Admin Screen

The `AdminScreen` allows form creators to:

1. Choose between creating a single dynamic form or a series of forms
2. Set the number of steps for a form series
3. Define step names
4. Generate and preview the form(s)

### Recipient Screen

The `RecipientScreen` allows users to:

1. Load JSON data from a URL or local file
2. Parse the JSON into a dynamic form
3. Display and interact with the generated form

## JSON Parsing

The library uses the `DynamicForm` model to parse JSON data into form fields:

```dart
var decodedJson = DynamicForm.fromJson(jsonDecode(jsonString));
```

## Form Building

Forms are built using the `FormBuilder` widget from the `flutter_form_builder` package, with `DynamicFormInput` widgets generated for each field in the parsed JSON.

## Error Handling

The library includes error handling for JSON parsing and loading issues, displaying appropriate error messages to the user.

## Customization

Developers can extend the library by adding new field types to the `DynamicFormInput` widget and corresponding field widgets for rendering.

## Dependencies

- flutter_form_builder: For building dynamic forms
- form_builder_validators: For form field validation
- country_state_city: For country and state data in address fields
- google_generative_ai: For AI-powered form generation using Gemini API

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Future Expansion

1. Loading in a series of forms and processing series of forms.
2. Support for other LLMs besides Gemini.
3. Better UI/UX for form creation and management.
4. Enhanced validation options for form fields.
5. Integration with more backend services and databases.
6. Implement Gemini API integration for dynamic form JSON generation based on natural language descriptions.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

For detailed information on JSON structure and field types, refer to the [full documentation](link-to-full-docs).

If you encounter any issues or have questions, please file an issue on the GitHub repository.

Author: Nam Bui.
