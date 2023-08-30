import 'dart:async';

import 'package:build/build.dart';
import 'package:glob/glob.dart';

// ignore: public_member_api_docs
class ExportsBuilder implements Builder {
  static var exportFileName = "auto_export";

  @override
  // ignore: type_annotate_public_apis
  Map<String, List<String>> get buildExtensions {
    return {
      r'$lib$': ['${exportFileName}.dart']
    };
  }

  @override
  Future<void> build(BuildStep buildStep) async {
    final packageName = buildStep.inputId.package;
    final exports = buildStep.findAssets(Glob('**/*.exports'));
    final content = [
      """
/// GENERATED CODE - DO NOT MODIFY BY HAND
///
/// CREATED AT ${DateTime.now()}
///
""",
      "library ${packageName};\n",
      await for (var exportLibrary in exports)
        "export '${exportLibrary.changeExtension('.dart').uri}';",
    ];

    await buildStep.writeAsString(
        AssetId(buildStep.inputId.package, 'lib/${exportFileName}.dart'),
        content.join('\n'));
  }
}
