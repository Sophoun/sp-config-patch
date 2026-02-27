import 'package:sp_config_patch/file_manager.dart';
import 'package:sp_config_patch/yaml_reader.dart';

void main(List<String> arguments) async {
  final yamlPath = arguments.firstOrNull;
  final workDir = arguments.elementAtOrNull(1);
  if (yamlPath == null) throw Exception("build.yaml file is not found.");
  if (workDir == null) throw Exception("working directory is not found.");

  /// read build.yaml file.
  final (changes, skips) = await readYaml(yamlPath);
  for (var e in skips) {
    print("Skip: $e");
  }

  /// list all file
  final files =
      await readAllFile(workDir, excludes: [yamlPath, ...skips], debug: false);

  /// apply changes
  for (var (from, to) in changes) {
    print("change from: $from to: $to");

    /// replace all with that match with the key.
    for (var file in files) {
      for (var skip in skips) {
        /// Continue loop if it's start with the skips group.
        if (file.path.startsWith(skip)) continue;
      }
      print("Finding in: ${file.path}");
      await replaceFromAndTo(file, from, to, debug: false);
    }
  }
  print("Success...");
}
