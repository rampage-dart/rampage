// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_browser_interop/browser_interop.dart' as interop;
import 'package:rampage_html/html.dart';

import 'js_wrapper.dart';

//-----------------------------------------------------------
// Node
//-----------------------------------------------------------

/// Browser implementation of [Node].
class NodeImpl<T extends interop.Node> extends JsWrapper<T> implements Node {
  /// Create an instance of [NodeImpl] from the [jsObject].
  NodeImpl.fromJsObject(T jsObject) : super.fromJsObject(jsObject);

  @override
  bool get isConnected => jsObject.isConnected;
}
