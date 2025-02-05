import 'package:web/web.dart' as js;

import 'document.dart';
import 'wrapper.dart';

class Element<T extends js.Element> extends DartJsWrapper<T> {
  factory Element.tag(String tag) => document.createElement(tag);

  Element.fromJsObject(super.jsObject) : super.fromJsObject();
}
