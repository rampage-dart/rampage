
import 'package:recase/recase.dart';

class NamingConvention {
  ///
  NamingConvention({
    Map<String, String> renameType = const <String, String>{},
    Map<String, String> replace = const <String, String>{},
  })  : _renameType = renameType,
        _replace = replace;

  final Map<String, String> _renameType;
  final Map<String, String> _replace;

  String typeName(String value) => _actualTypeName(value).pascalCase;

  /// If a
  String fileName(String value, [String suffix = '']) =>
      _actualTypeName(value).snakeCase + suffix;

  /// Converts the [value]
  ///
  /// For `enum` values the convention is camel case.
  ///
  ///
  String enumValue(String value, [String defaultTo = 'empty']) =>
      value.isNotEmpty ? value.camelCase : defaultTo;

  String fieldName(String value) => _replaceWith(value).camelCase;

  String methodName(String value) => _replaceWith(value).camelCase;

  String _actualTypeName(String value) => _renameType[value] ?? value;

  String _replaceWith(String value) {
    var replaced = value;
    _replace.forEach((key, value) {
      replaced = replaced.replaceAll(key, value);
    });

    return replaced;
  }
}
