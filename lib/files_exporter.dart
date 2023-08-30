library files_exporter;

import 'package:build/build.dart';
import 'package:files_exporter/src/auto_exporter.dart';

import 'src/exporter_generator_builder.dart';
import 'src/exports_builder.dart';

// ignore: public_member_api_docs
const version = '1.0.2';

/// Mark class to be exported
///
/// [build_runner] will export file container class with this annotation
const export = AutoExporter();

// ignore: public_member_api_docs
Builder exporterGeneratorBuilder(BuilderOptions options) {
  return ExporterGeneratorBuilder();
}

// ignore: public_member_api_docs
Builder exportsBuilder(BuilderOptions options) {
  return ExportsBuilder();
}
