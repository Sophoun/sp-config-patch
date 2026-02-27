import 'package:sp_config_patch/file_manager.dart';
import 'package:sp_config_patch/yaml_reader.dart';

void main(List<String> arguments) async {
  final yamlPath = arguments.firstOrNull;
  final workDir = arguments.elementAtOrNull(1);
  if (yamlPath == null) throw Exception("build.yaml file is not found.");
  if (workDir == null) throw Exception("working directory is not found.");

  /// read build.yaml file.
  final (changes, skips) = await readYaml(yamlPath);

  // log changes
  print("Changes...");
  for (var (from, to) in changes) {
    // ignore: dead_code
    if (false) {
      print("from: $from - to: $to");
    }
  }
  print("..........");

  /// list all file
  final files =
      await readAllFile(workDir, excludes: [yamlPath, ...skips], debug: false);

  /// apply changes
  for (var (from, to) in changes) {
    // replace all with that match with the key.
    for (var file in files) {
      await replaceFromAndTo(file, from, to, debug: false);
    }
  }
  print("Success...");
}
