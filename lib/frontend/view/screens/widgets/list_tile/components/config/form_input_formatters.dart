import 'package:number_text_input_formatter/number_text_input_formatter.dart';

final numericFormatter = NumberTextInputFormatter();
final salaryFormatter = NumberTextInputFormatter(groupDigits: 3);
final postalCodeFormatter =  NumberTextInputFormatter(
  integerDigits: 5,
  decimalDigits: 0,
);