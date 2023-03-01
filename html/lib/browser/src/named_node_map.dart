import 'dart:collection';
import 'dart:js';

import 'js/attribute.dart';
import 'js/document.dart';
import 'js/named_node_map.dart';
import 'wrapper.dart';

class NamedNodeMap extends JsWrapper
    with MapMixin<String, String>
    implements Map<String, String> {
  NamedNodeMap.fromJsObject(super.jsObject) : super.fromJsObject();

  @override
  String? operator [](Object? key) =>
      key != null ? _getAttribute(key.toString())?.value : null;

  @override
  void operator []=(String key, String value) {
    final attribute = _getAttribute(key) ?? _createAttribute(key)
      ..name = key
      ..value = value;

    jsObject.setNamedItem(attribute);
  }

  @override
  void clear() {
    keys.forEach(jsObject.removeNamedItem);
  }

  @override
  Iterable<String> get keys sync* {
    final length = jsObject.length;

    for (var i = 0; i < length; ++i) {
      yield JsObject.fromBrowserObject(jsObject.item(i)!).name;
    }
  }

  @override
  String? remove(Object? key) {
    if (key != null) {
      final keyString = key.toString();
      final attribute = _getAttribute(keyString);

      if (attribute != null) {
        jsObject.removeNamedItem(keyString);
        return attribute.value;
      }
    }

    return null;
  }

  JsObject? _getAttribute(String name) {
    final attribute = jsObject.getNamedItem(name);

    return attribute != null ? JsObject.fromBrowserObject(attribute) : null;
  }

  JsObject _createAttribute(String name) {
    final document = JsObject.fromBrowserObject(context['document'] as Object);

    return JsObject.fromBrowserObject(document.createAttribute(name));
  }
}
