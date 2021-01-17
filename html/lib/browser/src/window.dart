// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'event_target.dart';
import 'wrapper.dart';

/// Browser implementation of [Window].
class WindowImpl extends EventTargetImpl implements Window {
  /// Create an instance of [WindowImpl] from the [jsObject].
  WindowImpl.fromJsObject(JsObject jsObject) : super.fromJsObject(jsObject);

  /// Create an instance of [WindowImpl] from the [jsObject].
  ///
  /// This constructor should be used when its unclear if the [jsObject] has
  /// already been wrapped.
  factory WindowImpl.safeFromJsObject(JsObject jsObject) =>
      (jsObject.dartObject ?? WindowImpl.fromJsObject(jsObject)) as WindowImpl;

  @override
  CustomElementRegistry get customElements =>
      throw UnimplementedError('customElements not implemented');

  @override
  Document get document => throw UnimplementedError('document not implemented');
}

/// The [Window] object.
Window get window => throw UnimplementedError('window not implemented');
