
import 'package:code_builder/code_builder.dart';
import 'package:web_idl/web_idl.dart';
import 'package:meta/meta.dart';

import 'references.dart';

class CodeBuilder extends ThrowingElementVisitor<Library> {
  CodeBuilder(this.converter);

  //@protected
  final WebIdlTypeConversions converter;

  @override
  Library visitInterface(InterfaceElement element) => _emptyLibrary();

  @override
  Library visitDictionary(DictionaryElement element) => _emptyLibrary();

  @override
  Library visitNamespace(NamespaceElement element) => _emptyLibrary();

  @override
  Library visitEnum(EnumElement element) => _emptyLibrary();

  @override
  Library visitFunctionTypeAlias(FunctionTypeAliasElement element) => _emptyLibrary();

  @override
  Library visitTypeAlias(TypeAliasElement element) => _emptyLibrary();

  static Library _emptyLibrary() => Library((b) => b);
}
