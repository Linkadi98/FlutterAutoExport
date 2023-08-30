import 'dart:async';

import 'package:build/build.dart';
import 'package:glob/glob.dart';

// ignore: public_member_api_docs
class ExportsBuilder implements Builder {
  static var packageName = "exporter";

  @override
  // ignore: type_annotate_public_apis
  final buildExtensions = {
    r'$lib$': ['${packageName}.dart']
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    print("Exporter called");
    final exports = buildStep.findAssets(Glob('**/*.exports'));
    final content = [
      "// GENERATED CODE - DO NOT MODIFY BY HAND",
      "",
      "// created at ${DateTime.now()}"
          "",
      await for (var exportLibrary in exports)
        "export '${exportLibrary.changeExtension('.dart').uri}';",
    ];
    await buildStep.writeAsString(
        AssetId(buildStep.inputId.package, 'lib/${packageName}.dart'),
        content.join('\n'));
  }
}
