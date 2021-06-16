import 'dart:js';

import 'package:rampage_html/html.dart';

import 'document.dart';
import 'document_fragment.dart';
import 'element_from_js_object.dart';
import 'js/node.dart';
import 'node.dart';
import 'wrapper.dart';

NodeImpl nodeFromJsObject(JsObject jsObject) {
  assert(jsObject.dartObject == null, 'the jsObject should not be wrapped');

  final nodeType = jsObject.nodeType;
  switch (nodeType) {
    case 1:
      return elementFromJsObject(jsObject);
    case 9:
      return DocumentImpl.fromJsObject(jsObject);
    case 11:
      return DocumentFragmentImpl.fromJsObject(jsObject);
  }

  throw UnsupportedError('Unknown node type $nodeType');
}

NodeImpl safeNodeFromObject(Object object) =>
    safeJsWrapperFromObject<NodeImpl>(object, nodeFromJsObject);

NodeImpl? safeNodeFromObjectNullable<T extends Node>(Object? object) =>
    safeJsWrapperFromObjectNullable<NodeImpl>(object, nodeFromJsObject);
