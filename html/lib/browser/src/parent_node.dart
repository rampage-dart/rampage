// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_browser_interop/browser_interop.dart' as interop;
import 'package:rampage_html/html.dart';

import 'element.dart';
import 'node.dart';

/// Browser implementation of [ParentNode].
mixin ParentNodeImpl<T extends interop.ParentNode> on NodeImpl<T>
    implements ParentNode {
  @override
  void append(Node node) {
    jsObject.append((node as NodeImpl).jsObject);
  }

  @override
  void prepend(Node node) {
    jsObject.prepend((node as NodeImpl).jsObject);
  }

  @override
  T querySelector<T extends Element>(String selectors) {
    final result = jsObject.querySelector(selectors);

    return result != null ? safeElementFromJsObject<T>(result) : null;
  }

  @override
  Iterable<T> querySelectorAll<T extends Element>(String selectors) sync* {
    final result = jsObject.querySelectorAll(selectors);
    final count = result.length;

    for (var i = 0; i < count; ++i) {
      yield safeElementFromJsObject<T>(result.item(i) as interop.Element);
    }
  }
}
