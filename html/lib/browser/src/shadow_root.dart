// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/html.dart';

import 'document_fragment.dart';
import 'document_or_shadow_root.dart';
import 'element_from_js_object.dart';
import 'js/shadow_root.dart';
import 'wrapper.dart';

/// Browser implementation of [ShadowRoot].
class ShadowRootImpl extends DocumentFragmentImpl
    with DocumentOrShadowRootImpl
    implements ShadowRoot {
  /// Create an instance of [ShadowRootImpl] from the [jsObject].
  ShadowRootImpl.fromJsObject(super.jsObject) : super.fromJsObject();

  @override
  late final Element host = safeElementFromObject(jsObject.host);
}

/// Create an instance of [ShadowRoot] from the [object].
///
/// This should be used when its unclear if the [object] has already been
/// wrapped.
ShadowRoot safeShadowRootFromObject(Object object) =>
    safeJsWrapperFromObject<ShadowRootImpl>(
      object,
      ShadowRootImpl.fromJsObject,
    );

/// Create an instance of [ShadowRoot] from the [object]; or null otherwise.
///
/// This should be used when its unclear if the [object] has already been
/// wrapped.
ShadowRoot? safeShadowRootFromObjectNullable(Object? object) =>
    safeJsWrapperFromObjectNullable<ShadowRootImpl>(
      object,
      ShadowRootImpl.fromJsObject,
    );
