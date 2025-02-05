import 'package:code_builder/code_builder.dart';
import 'package:web_idl/web_idl.dart';

import 'generator_command.dart';
import 'source_generator.dart';
import 'type_converter.dart';

final class DartGenerator extends SourceGenerator {
  DartGenerator({TypeMap? mapping})
      : super(TypeConverter.dart(mapping: mapping));
}

final class DartGeneratorCommand extends GeneratorCommand {
  DartGeneratorCommand() : super(DartGenerator());

  @override
  final String name = 'dart';
  @override
  final String description = '';
}
