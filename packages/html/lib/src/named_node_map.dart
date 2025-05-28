// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:collection';

import 'package:meta/meta.dart';

import 'js_interop/document.dart' as js;
import 'js_interop/named_node_map.dart' as js;
import 'wrapper.dart';

@internal
class NamedNodeMap extends JsWrapper<js.NamedNodeMap>
    with MapMixin<String, String>
    implements Map<String, String> {
  NamedNodeMap.fromJsObject(super.jsObject) : super.fromJsObject();

  @override
  String? operator [](Object? key) =>
      key != null ? jsObject.getNamedItem(key.toString())?.value : null;

  @override
  void operator []=(String key, String value) {
    final attribute =
        jsObject.getNamedItem(key) ?? js.document.createAttribute(key)
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
      yield jsObject.item(i)!.name;
    }
  }

  @override
  String? remove(Object? key) {
    if (key != null) {
      final keyString = key.toString();
      final attribute = jsObject.getNamedItem(keyString);

      if (attribute != null) {
        jsObject.removeNamedItem(keyString);
        return attribute.value;
      }
    }

    return null;
  }
}
