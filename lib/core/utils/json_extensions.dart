import 'dart:convert';

extension JsonMapExtensions on Map<String, dynamic> {
  String prettify() => const JsonEncoder.withIndent('  ').convert(this);
}
