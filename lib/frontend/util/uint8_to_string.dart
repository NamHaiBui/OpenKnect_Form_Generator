import 'dart:convert';
import 'dart:typed_data';

extension Uint8ListToString on Uint8List {
  String decodeToString() {
    return utf8.decode(this);
  }
}
