class FormJson {
  static const String formJson = '''
{
  "id": 1,
  "name": "Contact Details Form",
  "fields": [
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
    },
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
    },
    {
      "type": "checkBox",
      "label": "Checkbox",
      "initialValue": ["true"],
      "key": "checkbox",
      "options": ["Option1"],
      "validations": {
        "required": true
      }
    },
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
    },
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
    },
    {
      "type": "dateRange",
      "label": "Date Range",
      "date": {
        "dateFormat": "yyyy-MM-dd",
        "firstDate": "2000-01-01",
        "lastDate": "2023-12-31"
      },
      "initialValue": ["2023-12-25","2023-12-26"],
      "key": "dateRange",
      "options": [],
      "validations": {
        "required": true
      }
    },
    {
      "type": "numRange",
      "label": "Number Range",
      "initialValue": ["10", "50"],
      "key": "numRange",
      "options": [],
      "validations": {
        "required": true
      }
    },
    {
      "type": "address",
      "label": "Address",
      "initialValue": ["123 Main St", "Carli", "Anytown", "CA", "12345"],
      "key": "address",
      "options": [],
      "validations": {
        "required": true
      }
    },
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
  ]
}''';
  static const adminFormJson = '''
{
    "id": 0,
    "name": "Admin Form Creator",
    "fields": [
        {
            "type": "textBox",
            "label": "How many form step would you like to create?",
            "initialValue": [
                "4"
            ],
            "key": "StepCount",
            "text": "Input form step count here",
            "options": [],
            "validations": {
                "required": true,
                "numeric": true,
                "minLength": 1,
                "maxLength": 1,
                "minNumber": 1,
                "maxNumber": 4
            }
        },
        {
            "type": "textBox",
            "label": "Form Field",
            "initialValue": [
                ""
            ],
            "key": "textbox1",
            "text": "Enter text for textbox 1",
            "options": [],
            "validations": {
                "required": true,
                "maxLength": 10
            }
        }
    ]
}
''';
  const FormJson._();
}
