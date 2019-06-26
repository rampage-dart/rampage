// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_browser_interop/browser_interop.dart' as interop;

/// Wraps a JavaScript object.
class JsWrapper<T extends interop.JsObject> {
  /// Creates a [JsWrapper] around the [jsObject].
  JsWrapper.fromJsObject(this.jsObject)
      : assert(
          jsObject.dartObject == null,
          'Another Dart Object is attached to the JsObject',
        ) {
    jsObject.dartObject = this;
  }

  /// The JavaScript object being wrapped.
  final T jsObject;
}
