import 'dart:convert';

extension StringExt on String {
  String toBase64() => base64.encode(utf8.encode(this));
}
