// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

void main() async {
  // await run('flutter clean');
  await run('flutter pub get');
  await run('flutter pub run build_runner build --delete-conflicting-outputs');

  await updateJsonData(
    jsonPath: "data/work_projects.json",
    generatedPath: "lib/gen/work_projects.gen.dart",
  );
  await updateJsonData(
    jsonPath: "data/skills.json",
    generatedPath: "lib/gen/skills.gen.dart",
  );
}

Future<void> run(String command) async {
  final params = command.split(' ').toList();
  Process result = await Process.start(
    params.removeAt(0),
    params,
    runInShell: true,
  );
  result.stdout.transform(utf8.decoder).forEach(print);
  await result.exitCode;
}

Future<String> updateJsonData({
  required String jsonPath,
  required String generatedPath,
}) async {
  final jsonFile = File(jsonPath);
  if (!jsonFile.existsSync()) {
    throw 'Cannot read json $jsonPath: file not found';
  }
  final jsonString = jsonFile.readAsStringSync();
  final jsonStringCompressed = json.encode(json.decode(jsonString));

  final targetFile = File(generatedPath);
  if (!targetFile.existsSync()) {
    throw 'Cannot write to $generatedPath: file not found';
  }
  final content = targetFile.readAsStringSync().replaceAll(
        RegExp(r"// --- JSON START ---\n((.|\n)+)// --- JSON END ---"),
        "// --- JSON START ---\nconst String _json =\n    \"\"\"$jsonStringCompressed\"\"\";\n// --- JSON END ---",
      );
  targetFile.writeAsString(content);

  return jsonStringCompressed;
}
