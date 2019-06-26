// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/browser/html.dart' as impl;

import 'document.dart';

/// The [Window] interface represents a window containing a DOM document; the
/// [Window.document] property points to the DOM document loaded in that window.
abstract class Window {
  /// A reference to the [Document] contained in the [Window].
  Document get document;
}

/// The [Window] object.
Window get window => impl.window;
