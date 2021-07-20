import 'package:code_builder/code_builder.dart';
import 'package:recase/recase.dart';
import 'package:web_idl/web_idl.dart';

import 'code_builder.dart';
import 'references.dart';

import 'references/references.dart';

///
///
/// For `interface`s
///
/// For `enum`s
///
/// For `callback`s
class ConversionBuilder extends CodeBuilder {
  /// Creates an instance of [ConversionBuilder].
  ConversionBuilder() : super(ImplementationTypeConversions());

  final ConversionReferences _refs = ConversionReferences();
  final References _interfaceRefs = References();

  //------------------------------------------------------------------
  // EnumElement
  //------------------------------------------------------------------

  @override
  Library visitEnum(EnumElement element) => Library(
        (l) => l
          ..directives.addAll(_enumDirectives(element))
          ..body.addAll(<Spec>[
            _enumToJs(element),
          ]),
      );

  Iterable<Directive> _enumDirectives(EnumElement element) sync* {
    yield _interfaceRefs.import();
  }

  Extension _enumToJs(EnumElement element) {
    final enumRef = element.refer(_interfaceRefs);

    // Generate the getter body
    final body = StringBuffer('switch (this) {');
    for (final value in element.values) {
      final valueSymbol = Reference(value).symbol; //_refs.enumValue(value);
      body.write('case ${enumRef.symbol}.$valueSymbol:'
          '  return $valueSymbol;');
    }
    body.write('}');

    return Extension(
      (e) => e
        ..name = 'Foo'
        ..on = enumRef
        ..docs.add('/// Conversions')
        ..methods.add(Method(
          (m) => m
            ..name = 'jsEnum'
            ..type = MethodType.getter
            ..returns = enumRef
            ..lambda = false
            ..body = Code(body.toString())
            ..docs.add('/// Converts'),
        )),
    );
  }
}

class ConversionReferences extends References {
  Reference enumToJs(SingleType type) {
    final ref = referType(type);

    return Reference('${ref.symbol}String', ref.url);
  }

  Reference enumFromJs(SingleType type) {
    final ref = referType(type);

    return Reference('String${ref.symbol}', ref.url);
  }
}

extension on TypeDefiningElement {
  Reference refer(References references) => references.referType(thisType);
}

class ImplementationTypeConversions extends WebIdlTypeConversions {}
