// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'document_fragment.dart';
import 'js/shadow_root.dart';
import 'shadow_root.dart';
import 'wrapper.dart';

DocumentFragmentImpl documentFragmentFromJsObject(JsObject jsObject) {
  assert(jsObject.dartObject == null, 'the jsObject should not be wrapped');

  return ShadowRootJsObject(jsObject).isInstanceOf
      ? ShadowRootImpl.fromJsObject(jsObject)
      : DocumentFragmentImpl.fromJsObject(jsObject);
}

/// Safely retrieves or creates an instance of [DocumentFragmentImpl] from the
/// [object].
DocumentFragmentImpl safeDocumentFragmentFromObject(Object object) =>
    safeJsWrapperFromObject<DocumentFragmentImpl>(
      object,
      documentFragmentFromJsObject,
    );

/// Safely retrieves or creates an instance of [DocumentFragmentImpl] from the
/// [object] if it is not `null`.
DocumentFragmentImpl? safeDocumentFragmentFromObjectNullable(Object? object) =>
    safeJsWrapperFromObjectNullable<DocumentFragmentImpl>(
      object,
      documentFragmentFromJsObject,
    );
