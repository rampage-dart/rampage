// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'event_target.dart';

/// Browser implementation of [Node].
class NodeImpl extends EventTargetImpl implements Node {
  /// Create an instance of [NodeImpl] from the [jsObject].
  NodeImpl.fromJsObject(JsObject jsObject) : super.fromJsObject(jsObject);

  @override
  bool get isConnected =>
      throw UnimplementedError('isConnected not implemented');

  @override
  T cloneNode<T extends Node>() =>
      throw UnimplementedError('cloneNode not implemented');
}
