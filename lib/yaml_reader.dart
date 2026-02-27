import 'dart:io';

import 'package:yaml/yaml.dart';

/// Read yaml file and return all key with value
Future<(List<(String from, String to)> changes, List<String> skips)> readYaml(
    String yamlPath) async {
  final changes = <(String from, String to)>[];
  final content = await File(yamlPath).readAsString();
  final yaml = loadYaml(content);

  /// changes
  yaml['changes'].forEach((e) {
    final from = e['from'];
    final to = e["to"];
    changes.add((from, to));
  });

  /// skips
  final skips = <String>[];
  yaml['skips'].forEach((e) {
    skips.add(e);
  });

  return (changes, skips);
}
