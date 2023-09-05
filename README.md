[![pub package](https://img.shields.io/pub/v/files_exporter.svg)](https://pub.dev/packages/files_exporter)
# Files Exporter

A new Flutter package that allows you to auto export types globally.

This package is a fork version of [auto_export](https://pub.dev/packages/auto_export) package.

Thank you [Alberto Monteiro](https://github.com/AlbertoMonteiro) for your repository.

## Getting Started

To use auto export feature, you just need to add the `@export` annotation to your class that you want to be automatically exported in the `lib/auto_export.dart` file.

Then in your other files, you just need to import the `auto_export.dart` file to have access to all auto exported files

## Example

1. Add `@export` annotation to your class

```dart
  /// don't forget to import this package
  import 'package:files_exporter/files_exporter.dart';

  @export
  class MyExportedClass {
    // ...
  }
```

2. In your terminal, run the following command

```bash
$ dart run build_runner build
``` 