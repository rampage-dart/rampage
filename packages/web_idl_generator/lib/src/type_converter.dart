import 'package:code_builder/code_builder.dart';
import 'package:web_idl/web_idl.dart';

typedef TypeMapKey = String;
typedef TypeMapValue = (String, String?);
typedef TypeMapEntry = MapEntry<TypeMapKey, TypeMapValue>;
typedef TypeMap = Map<TypeMapKey, TypeMapValue>;

class TypeConverter {
  factory TypeConverter.jsInterop([TypeMap? mapping]) = _JSTypeConverter;

  factory TypeConverter.dart([TypeMap? mapping]) =>
      TypeConverter._(dartAny, <String, (String, String?)>{
        ..._builtinMap(
          any: 'Object',
          undefined: 'void',
          boolean: 'bool',
          integer: 'int',
          number: 'double',
          string: 'String',
          list: 'List',
          object: 'Object',
          promise: 'Future',
        ),
        ...?mapping,
      });

  TypeConverter._(this._unionType, this._mapping);

  /// Dart doesn't support union types
  final TypeReference _unionType;

  /// Map from IDL name to Dart name
  final TypeMap _mapping;

  TypeReference convert(WebIdlType idl) =>
      idl is UnionType
          ? convertUnionType(idl)
          : convertSingleType(idl as SingleType);

  TypeReference convertUnionType(UnionType idl) => _unionType;

  TypeReference convertSingleType(SingleType idl) {
    final name = idl.name;
    final (symbol, url) = _mapping[idl.name] ?? (name, null);

    return TypeReference(
      (t) =>
          t
            ..symbol = symbol
            ..isNullable = idl.isNullable
            ..url = url
            ..types.addAll(idl.typeArguments.map(convert)),
    );
  }

  /// The `JSAny` type from `dart:js_interop`.
  static final jsAny = _jsInteropType('JSAny');

  /// The `JSBoolean` type from `dart:js_interop`.
  static final jsBoolean = _jsInteropType('JSBoolean');

  /// The `JSFunction` type from `dart:js_interop`.
  static final jsFunction = _jsInteropType('JSFunction');

  /// The `JSNumber` type from `dart:js_interop`.
  static final jsNumber = _jsInteropType('JSNumber');

  /// The `JSNumber` type from `dart:js_interop`.
  static final jsObject = _jsInteropType('JSObject');

  static TypeReference _jsInteropType(
    String symbol, {
    bool isNullable = false,
  }) => TypeReference(
    (t) =>
        t
          ..symbol = symbol
          ..isNullable = isNullable
          ..url = 'dart:js_interop',
  );

  static final dartAny = TypeReference(
    (t) =>
        t
          ..symbol = 'Object'
          ..isNullable = true,
  );

  static final dartString = TypeReference((t) => t..symbol = 'String');

  static TypeMap _builtinMap({
    required String any,
    required String undefined,
    required String boolean,
    required String integer,
    required String number,
    required String string,
    required String list,
    required String object,
    required String promise,
  }) => <String, (String, String?)>{
    'any': (any, null),
    'undefined': (undefined, null),
    'boolean': (boolean, null),
    'byte': (integer, null),
    'octet': (integer, null),
    'short': (integer, null),
    'unsigned short': (integer, null),
    'long': (integer, null),
    'unsigned long': (integer, null),
    'long long': (integer, null),
    'unsigned long long': (integer, null),
    'float': (number, null),
    'unrestricted float': (number, null),
    'double': (number, null),
    'unrestricted double': (number, null),
    'DOMString': (string, null),
    'ByteString': (string, null),
    'USVString': (string, null),
    'sequence': (list, null),
    'FrozenArray': (list, null),
    'ObservableArray': (list, null),
    'object': (object, null),
    'Promise': (promise, null),
  };
}

final class _JSTypeConverter extends TypeConverter {
  _JSTypeConverter([TypeMap? mapping])
    : _inner = TypeConverter._(TypeConverter.jsAny, <String, (String, String?)>{
        ...TypeConverter._builtinMap(
          any: 'JSAny',
          undefined: 'JSAny?',
          boolean: 'JSBoolean',
          integer: 'JSNumber',
          number: 'JSNumber',
          string: 'JSString',
          list: 'JSArray',
          object: 'JSObject',
          promise: 'JSPromise',
        ),
        ...?mapping,
      }),
      super._(TypeConverter.jsAny, <String, (String, String?)>{
        ...TypeConverter._builtinMap(
          any: 'JSAny',
          undefined: 'void',
          boolean: 'bool',
          integer: 'int',
          number: 'double',
          string: 'String',
          list: 'List',
          object: 'JSObject',
          promise: 'JSPromise',
        ),
        ...?mapping,
      });

  final TypeConverter _inner;

  @override
  TypeReference convertSingleType(SingleType idl) {
    final name = idl.name;

    return switch (name) {
      'sequence' ||
      'ObservableArray' ||
      'FrozenArray' => _inner.convertSingleType(idl),
      _ => super.convertSingleType(idl),
    };
  }
}
