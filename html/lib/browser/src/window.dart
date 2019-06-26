// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_browser_interop/browser_interop.dart' as interop;
import 'package:rampage_html/html.dart';

import 'js_wrapper.dart';

/// Browser implementation of [Window].
class WindowImpl extends JsWrapper<interop.Window> implements Window {
  /// Create an instance of [WindowImpl] from the [jsObject].
  WindowImpl.fromJsObject(interop.Window jsObject)
      : super.fromJsObject(jsObject);
}

WindowImpl _window;

/// The [Window] object.
WindowImpl get window {
  if (_window != null) {
    return _window;
  }

  return _window = WindowImpl.fromJsObject(interop.window);
}
