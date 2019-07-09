// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_browser_interop/browser_interop.dart' as interop;
import 'package:rampage_html/html.dart';

import 'node.dart';

//-----------------------------------------------------------
// DocumentFragment
//-----------------------------------------------------------

/// Browser implementation of [DocumentFragment].
class DocumentFragmentImpl extends NodeImpl<interop.DocumentFragment>
    implements DocumentFragment {
  /// Create an instance of [DocumentFragmentImpl].
  factory DocumentFragmentImpl() => DocumentFragmentImpl.fromJsObject(
        interop.window.document.createDocumentFragment(),
      );

  /// Create an instance of [DocumentFragmentImpl] from the [jsObject].
  DocumentFragmentImpl.fromJsObject(interop.DocumentFragment jsObject)
      : super.fromJsObject(jsObject);

  /// Create an instance of [DocumentFragmentImpl] from the [jsObject].
  ///
  /// This constructor should be used when its unclear if the [jsObject] has
  /// already been wrapped.
  factory DocumentFragmentImpl.safeFromJsObject(
          interop.DocumentFragment jsObject) =>
      jsObject.dartObject as DocumentFragmentImpl ??
      DocumentFragmentImpl.fromJsObject(jsObject);
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
