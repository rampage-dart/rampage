import 'dart:js_interop';

import 'package:web/web.dart' as js;

import 'element.dart';
import 'wrapper.dart';
import 'js/wrapper.dart';

class Document extends DartJsWrapper<js.Document> {
  Document.fromJsObject(super.jsObject) : super.fromJsObject();

  Element<T> createElement<T extends js.Element>(String tag) {
    final element = jsObject.createElement(tag);
    assert((element as DartWrapper).dartObject != null);

    return (element as DartWrapper).dartObject!.toDart as Element<T>;
  }
}

final document = Document.fromJsObject(js.document);
