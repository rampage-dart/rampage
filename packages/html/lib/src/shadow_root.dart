// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

import 'document_fragment.dart';
import 'document_or_shadow_root.dart';
import 'element.dart';
import 'js_interop/shadow_root.dart' as js;
import 'wrapper.dart';

/// Browser implementation of [ShadowRoot].
class ShadowRoot extends DocumentFragment<js.ShadowRoot>
    with DocumentOrShadowRoot<js.ShadowRoot> {
  @protected
  ShadowRoot.fromJsObject(super.jsObject) : super.fromJsObject();

  late final Element host = safeElementFromJsObject(jsObject.host);
}

@internal
ShadowRoot safeShadowRootFromObject(js.ShadowRoot jsObject) =>
    safeJsWrapperFromJsObject<js.ShadowRoot>(jsObject, ShadowRoot.fromJsObject)
        as ShadowRoot;

@internal
ShadowRoot? safeShadowRootFromObjectNullable(js.ShadowRoot? jsObject) =>
    safeJsWrapperFromJsObjectNullable<js.ShadowRoot>(
          jsObject,
          ShadowRoot.fromJsObject,
        )
        as ShadowRoot;
