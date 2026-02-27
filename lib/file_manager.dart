import 'dart:io';

/// Replace content of the file with the provided content.
Future<void> replaceFromAndTo(
  File file,
  String from,
  String to, {
  bool debug = false,
}) async {
  String content;
  try {
    content = await file.readAsString();
  } catch (err) {
    content = "";
    if (debug) {
      print("Unable to read file: ${file.path}");
    }
  }
  if (content.contains(from)) {
    if (debug) print("Change: ${file.path}, from: $from, to: $to");
    final replaced = content.replaceAll(from, to);
    await file.writeAsString(replaced);
  }
}

/// List all file in directory path that provided.
Future<List<File>> readAllFile(
  String path, {
  List<String> excludes = const [],
  bool debug = false,
}) async {
  final directory = Directory(path);
  final files = <File>[];

  await directory
      .list(recursive: true)
      .where((element) {
        for (var e in excludes) {
          if (element.path.startsWith(e)) return false;
        }
        return true;
      })
      .where((event) => event is File)
      .map((event) => event as File)
      .forEach((file) async {
        if (debug) print(file.path);
        files.add(file);
      });

  return files;
}
