// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'document_fragment.dart';
import 'document_or_shadow_root.dart';
import 'wrapper.dart';

/// Browser implementation of [ShadowRoot].
class ShadowRootImpl extends DocumentFragmentImpl
    with DocumentOrShadowRootImpl
    implements ShadowRoot {
  /// Create an instance of [ShadowRootImpl] from the [jsObject].
  ShadowRootImpl.fromJsObject(JsObject jsObject) : super.fromJsObject(jsObject);

  /// Create an instance of [DocumentFragmentImpl] from the [jsObject].
  ///
  /// This constructor should be used when its unclear if the [jsObject] has
  /// already been wrapped.
  factory ShadowRootImpl.safeFromJsObject(JsObject jsObject) =>
      (jsObject.dartObject ?? ShadowRootImpl.fromJsObject(jsObject))
          as ShadowRootImpl;

  @override
  Element get host => throw UnimplementedError('host not implemented');
}
