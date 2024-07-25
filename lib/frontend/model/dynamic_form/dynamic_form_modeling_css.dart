import 'package:json/json.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form/css/json_size.dart';

import 'css/basic_json_ts.dart';
import 'css/json_border.dart';
import 'css/json_margin.dart';
import 'css/json_padding.dart';

@JsonCodable()
class DynamicFormCSS {
  final String? backgroundColor; // Hex color code, e.g., "#FF0000"
  final BasicJSONTS? inputTextStyle;
  final BasicJSONTS? labelTextStyle; // Font size in points
  final JSONMargin? margin; // Uniform margin on all sides
  final JSONPadding? padding; // Uniform padding on all sides
  final JSONBorder? border;
  final JSONBorder? enabledBorder;
  final JSONBorder? focusedBorder;
  final JSONBorder? errorBorder;
  final JSONSize? size;
  DynamicFormCSS({
    this.backgroundColor,
    this.inputTextStyle,
    this.labelTextStyle,
    this.size,
    this.margin,
    this.padding,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
  });
}
