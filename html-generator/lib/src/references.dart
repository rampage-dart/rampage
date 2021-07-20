import 'package:code_builder/code_builder.dart';
import 'package:meta/meta.dart';
import 'package:recase/recase.dart';
import 'package:web_idl/web_idl.dart';

import 'package:web_idl/src/parser/builtin_types.dart' as types;

///
class WebIdlTypeConversions {
  final Map<String, String> _renameTo;
  final Map<String, Reference> _referenceMap;

  WebIdlTypeConversions({
    Map<String, String> renameTo = const <String, String>{},
  })  : _renameTo = renameTo,
        _referenceMap = _builtins;

  String dartType(SingleType type) {
    return dartTypeRef(type).symbol!;
  }

  Reference dartTypeRef(SingleType type) {
    var reference = _referenceMap[type.name];
    if (reference == null) {
      print('Looking for -> ${type.name}');

      if (type.isSequence) {
        reference = const Reference('List');
      } else {
        final element = type.element;

        if (element is InterfaceElement) {
          reference = dartInterfaceTypeRef(type);
        } else if (element is DictionaryElement) {
          reference = dartDictionaryTypeRef(type);
        } else if (element is FunctionTypeAliasElement) {
          reference = dartFunctionTypeRef(type);
        } else if (element is EnumElement) {
          reference = dartEnumTypeRef(type);
        } else {
          reference = dartTypeAliasRef(type);
        }
    }
    }

    return type.isNullable ? reference.nullable : reference;
  }

  @protected
  Reference dartInterfaceTypeRef(SingleType type) => _singleTypeRef(type);

  @protected
  Reference dartDictionaryTypeRef(SingleType type) => _singleTypeRef(type);

  @protected
  Reference dartFunctionTypeRef(SingleType type) => _singleTypeRef(type);

  @protected
  Reference dartEnumTypeRef(SingleType type) => _singleTypeRef(type);

  @protected
  Reference dartTypeAliasRef(SingleType type) => _singleTypeRef(type);

  Reference _singleTypeRef(SingleType type) {
    final name = _renameTo[type.name] ?? type.name;
    final url = !type.isBuiltIn ? '${name.snakeCase}.dart' : null;

    return Reference(name, url);
  }
}

const _dartJsUrl = 'dart:js';
const _dartTypedDataUrl = 'dart:typed_data';

const _builtins = <String, Reference>{
  // \TODO REMOVE THIS
  'DOMHighResTimeStamp': doubleReference,

  // `SingleType`s
  types.any: objectReference,

  // `PrimitiveType`s
  types.undefined: voidReference,
  types.boolean: boolReference,
  types.byte: intReference,
  types.octet: intReference,
  types.bigint: Reference('Bigint'),

  // `FloatType`s
  types.float: doubleReference,
  types.double: doubleReference,
  '${types.unrestricted} ${types.float}': doubleReference,
  '${types.unrestricted} ${types.double}': doubleReference,

  // `UnsignedIntegerType`s
  '${types.unsigned} ${types.short}': intReference,
  '${types.unsigned} ${types.long}': intReference,
  '${types.unsigned} ${types.long} ${types.long}': intReference,

  // `IntegerType`s
  types.short: intReference,
  types.long: intReference,
  '${types.long} ${types.long}': intReference,

  // `StringType`s
  types.byteString: stringReference,
  types.domString: stringReference,
  types.usvString: stringReference,

  // `BufferRelatedType`s
  types.arrayBuffer: Reference('', _dartTypedDataUrl),
  types.dataView: Reference('', _dartTypedDataUrl),
  types.int8Array: Reference('Int8List', _dartTypedDataUrl),
  types.int16Array: Reference('Int16List', _dartTypedDataUrl),
  types.int32Array: Reference('Int32List', _dartTypedDataUrl),
  types.uint8Array: Reference('Uint8List', _dartTypedDataUrl),
  types.uint16Array: Reference('Uint16List', _dartTypedDataUrl),
  types.uint32Array: Reference('Uint32List', _dartTypedDataUrl),
  types.uint8ClampedArray: Reference('Uint8ClampedList', _dartTypedDataUrl),
  types.float32Array: Reference('Float32List', _dartTypedDataUrl),
  types.float64Array: Reference('Float64List', _dartTypedDataUrl),
};

const Reference boolReference = Reference('bool');
const Reference intReference = Reference('int');
const Reference doubleReference = Reference('double');
const Reference stringReference = Reference('String');
const Reference objectReference = Reference('Object');
const Reference voidReference = Reference('void');

const Reference jsObjectReference = Reference('JsObject', _dartJsUrl);
const Reference jsFunctionReference = Reference('JsFunction', _dartJsUrl);

Reference mapReference(Reference key, Reference value) => TypeReference(
      (b) => b
        ..symbol = 'Map'
        ..types.addAll([key, value]),
    );

extension NullableReference on Reference {
  Reference get nullable {
    final builder = TypeReferenceBuilder();

    if (this is TypeReference) {
      builder.replace(this as TypeReference);
    } else {
      print('$symbol is nullable');
      builder
        ..symbol = symbol
        ..url = url
        ..isNullable = true;
    }

    return builder.build();
  }
}

extension DartJsType on WebIdlType {
  Reference get reference {
    // \TODO Should check if its a reference type
    final actualType = this;

    if (actualType is UnionType) {
      return _unionType(actualType);
    } else {
      return _singleType(actualType as SingleType);
    }
  }

  static Reference _unionType(UnionType type) => jsObjectReference;
  static Reference _singleType(SingleType type) {
    late final Reference reference;
    if (type.isBoolean) {
      reference = boolReference;
    } else {
      reference = jsObjectReference;
    }

    return type.isNullable ? reference.nullable : reference;
  }
}

extension BooleanType on SingleType {
  bool get isBoolean => name == 'boolean';
}

extension IntegerType on SingleType {
  bool get isInteger => name == '';
}
