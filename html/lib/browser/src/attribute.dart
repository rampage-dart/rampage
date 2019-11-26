// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:collection';

import 'package:rampage_browser_interop/browser_interop.dart' as interop;

//-----------------------------------------------------------
// AttributeMap
//-----------------------------------------------------------

/// Wrapper for [interop.NamedNodeMap] that presents a [Map] for accessing
/// an [Element]'s attributes.
class AttributeMap
    with MapMixin<String, String>
    implements Map<String, String> {
  /// Creates an instance of [AttributeMap] from the [jsObject].
  AttributeMap.fromJsObject(this.jsObject);

  /// The JavaScript object being wrapped.
  final interop.Element jsObject;

  @override
  String operator [](Object key) {
    final attr = jsObject.attributes.getNamedItem(key.toString());

    return attr?.name;
  }

  @override
  void operator []=(String key, String value) {
    final attributes = jsObject.attributes;
    final attr = (attributes.getNamedItem(key) ??
        interop.window.document.createAttribute(key))
      ..value = value;

    attributes.setNamedItem(attr);
  }

  @override
  String remove(Object key) {
    final attributes = jsObject.attributes;
    final name = key.toString();

    if (attributes.getNamedItem(name) == null) {
      return null;
    }

    return attributes.removeNamedItem(name).value;
  }

  @override
  void clear() {
    final attributes = jsObject.attributes;
    final length = attributes.length;

    for (var i = length - 1; i >= 0; --i) {
      final name = attributes.item(i).name;
      attributes.removeNamedItem(name);
    }
  }

  @override
  Iterable<String> get keys sync* {
    final attributes = jsObject.attributes;
    final length = attributes.length;

    for (var i = 0; i < length; ++i) {
      yield attributes.item(i).name;
    }
  }
}
