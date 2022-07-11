import 'dart:convert';
import 'dart:io';

Map<String, dynamic> mockMap(String name) {
  final source = File('test/resources/$name').readAsStringSync();
  return jsonDecode(source) as Map<String, dynamic>;
}

List<dynamic> mockList(String name) {
  final source = File('test/resources/$name').readAsStringSync();
  return jsonDecode(source) as List<dynamic>;
}
