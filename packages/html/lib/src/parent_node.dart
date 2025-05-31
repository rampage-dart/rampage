// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'element.dart';
import 'html_collection.dart';
import 'js_interop/parent_node.dart' as js;
import 'node.dart';

abstract mixin class ParentNode<T extends js.ParentNode> implements Node<T> {
  late final List<Element> children = HtmlCollection.fromJsObject(
    jsObject.children,
  );

  void append(Node node) {
    jsObject.append(node.jsObject);
  }

  U? querySelector<U extends Element>(String selectors) =>
      safeElementFromJsObjectNullable(jsObject.querySelector(selectors)) as U?;

  Iterable<U> querySelectorAll<U extends Node>(String selectors) sync* {
    final elements = jsObject.querySelectorAll(selectors);
    final length = elements.length;

    for (var i = 0; i < length; ++i) {
      yield safeNodeFromJsObject(elements.item(i)!) as U;
    }
  }
}
