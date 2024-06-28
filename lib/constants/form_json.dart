class FormJson {
  static const String formJson = '''{
  "id": 1,
  "name": "Contact Details Form",
  "fields": [
    {
      "type": "TextBox",
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
    },
    {
      "type": "DropdownList",
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
    },
    {
      "type": "CheckBox",
      "label": "Checkbox",
      "initialValue": ["true"],
      "key": "checkbox",
      "options": ["Option1"],
      "validations": {
        "required": true
      }
    },
    {
      "type": "CheckboxGroup",
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
    },
    {
      "type": "RadioGroup",
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
    },
    {
      "type": "Date",
      "label": "Date",
      "initialValue": ["2023-12-25"],
      "key": "date",
      "options": [],
      "validations": {
        "required": true
      }
    },
    {
      "type": "DateRange",
      "label": "Date Range",
      "initialValue": ["2023-12-20", "2023-12-30"],
      "key": "dateRange",
      "options": [],
      "validations": {
        "required": true
      }
    },
    {
      "type": "NumRange",
      "label": "Number Range",
      "initialValue": ["10", "50"],
      "key": "numRange",
      "options": [],
      "validations": {
        "required": true
      }
    },
    {
      "type": "Address",
      "label": "Address",
      "initialValue": ["123 Main St", "Carli", "Anytown", "CA", "12345"],
      "key": "address",
      "options": [],
      "validations": {
        "required": true
      }
    },
    {
      "type": "ToCollectCheckboxGroup",
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
  ]
}''';
  const FormJson._();
}
