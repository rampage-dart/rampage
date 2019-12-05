// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_browser_interop/browser_interop.dart' as interop;
import 'package:rampage_html/html.dart';

import 'node.dart';

/// Browser implementation of [ChildNode].
mixin ChildNodeImpl<T extends interop.ChildNode> on NodeImpl<T>
    implements ChildNode {
  @override
  void remove() {
    jsObject.remove();
  }

  @override
  void before(Node node) {
    jsObject.before((node as NodeImpl).jsObject);
  }

  @override
  void after(Node node) {
    jsObject.after((node as NodeImpl).jsObject);
  }

  @override
  void replaceWith(Node node) {
    jsObject.replaceWith((node as NodeImpl).jsObject);
  }
}
