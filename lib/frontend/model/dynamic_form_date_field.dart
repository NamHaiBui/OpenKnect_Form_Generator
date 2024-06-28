import 'package:json/json.dart';

@JsonCodable()
class DynamicFormDateField {
  final String dateFormat;
  final String firstDate;
  final String lastDate;

  DynamicFormDateField({
    required this.dateFormat,
    required this.firstDate,
    required this.lastDate,
  });
}
