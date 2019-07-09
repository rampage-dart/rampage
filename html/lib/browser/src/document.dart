// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_browser_interop/browser_interop.dart' as interop;
import 'package:rampage_html/html.dart';

import 'element.dart';
import 'node.dart';

//-----------------------------------------------------------
// DocumentFragment
//-----------------------------------------------------------

/// Browser implementation of [DocumentFragment].
class DocumentFragmentImpl<T extends interop.DocumentFragment>
    extends NodeImpl<T> with ParentNodeImpl<T> implements DocumentFragment {
  /// Create an instance of [DocumentFragmentImpl].
  factory DocumentFragmentImpl() => DocumentFragmentImpl.fromJsObject(
        interop.window.document.createDocumentFragment() as T,
      );

  /// Create an instance of [DocumentFragmentImpl] from the [jsObject].
  DocumentFragmentImpl.fromJsObject(T jsObject) : super.fromJsObject(jsObject);

  /// Create an instance of [DocumentFragmentImpl] from the [jsObject].
  ///
  /// This constructor should be used when its unclear if the [jsObject] has
  /// already been wrapped.
  factory DocumentFragmentImpl.safeFromJsObject(
          interop.DocumentFragment jsObject) =>
      jsObject.dartObject as DocumentFragmentImpl<T> ??
      DocumentFragmentImpl.fromJsObject(jsObject as T);
}

//-----------------------------------------------------------
// ShadowRoot
//-----------------------------------------------------------

/// Browser implementation of [ShadowRoot].
class ShadowRootImpl extends DocumentFragmentImpl<interop.ShadowRoot>
    implements ShadowRoot {
  /// Create an instance of [ShadowRootImpl] from the [jsObject].
  ShadowRootImpl.fromJsObject(interop.ShadowRoot jsObject)
      : super.fromJsObject(jsObject);

  /// Create an instance of [DocumentFragmentImpl] from the [jsObject].
  ///
  /// This constructor should be used when its unclear if the [jsObject] has
  /// already been wrapped.
  factory ShadowRootImpl.safeFromJsObject(interop.ShadowRoot jsObject) =>
      jsObject.dartObject as ShadowRootImpl ??
      ShadowRootImpl.fromJsObject(jsObject);

  @override
  Element get host => safeElementFromJsObject(jsObject.host);
}

//-----------------------------------------------------------
// Document
//-----------------------------------------------------------

/// Browser implementation of [Document].
class DocumentImpl extends NodeImpl<interop.Document>
    with ParentNodeImpl<interop.Document>
    implements Document {
  /// Create an instance of [DocumentImpl] from the [jsObject].
  DocumentImpl.fromJsObject(interop.Document jsObject)
      : super.fromJsObject(jsObject);

  /// Create an instance of [DocumentImpl] from the [jsObject].
  ///
  /// This constructor should be used when its unclear if the [jsObject] has
  /// already been wrapped.
  factory DocumentImpl.safeFromJsObject(interop.Document jsObject) =>
      jsObject.dartObject as DocumentImpl ??
      DocumentImpl.fromJsObject(jsObject);
}
