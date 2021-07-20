import 'package:code_builder/code_builder.dart';
import 'package:web_idl/web_idl.dart';

import 'naming_convention.dart';

class References {
  Directive import() => Directive((d) => d
    ..url = ''
    ..type = DirectiveType.import);

  Reference referType(SingleType type) => throw UnsupportedError('');
}
