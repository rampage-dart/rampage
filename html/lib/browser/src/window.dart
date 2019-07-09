// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_browser_interop/browser_interop.dart' as interop;
import 'package:rampage_html/html.dart';

import 'custom_element.dart';
import 'document.dart';
import 'js_wrapper.dart';

/// Browser implementation of [Window].
class WindowImpl extends JsWrapper<interop.Window> implements Window {
  /// Create an instance of [WindowImpl] from the [jsObject].
  WindowImpl.fromJsObject(interop.Window jsObject)
      : super.fromJsObject(jsObject);

  /// Create an instance of [WindowImpl] from the [jsObject].
  ///
  /// This constructor should be used when its unclear if the [jsObject] has
  /// already been wrapped.
  factory WindowImpl.safeFromJsObject(interop.Window jsObject) =>
      jsObject.dartObject as WindowImpl ?? WindowImpl.fromJsObject(jsObject);

  @override
  final CustomElementRegistry customElements = CustomElementRegistryImpl();

  @override
  DocumentImpl get document => DocumentImpl.safeFromJsObject(jsObject.document);
}

WindowImpl _window;

/// The [Window] object.
WindowImpl get window => _window ??= WindowImpl.fromJsObject(interop.window);
