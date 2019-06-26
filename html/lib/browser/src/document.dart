// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_browser_interop/browser_interop.dart' as interop;
import 'package:rampage_html/html.dart';

import 'js_wrapper.dart';

/// Browser implementation of [Document].
class DocumentImpl extends JsWrapper<interop.Document> implements Document {
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
