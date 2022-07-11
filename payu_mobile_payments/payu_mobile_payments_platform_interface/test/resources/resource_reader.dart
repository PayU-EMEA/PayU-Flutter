import 'dart:convert';
import 'dart:io';

Map<String, dynamic> resource(String name) {
  final source = File('test/resources/$name').readAsStringSync();
  return jsonDecode(source) as Map<String, dynamic>;
}
