// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

@JS()
library rampage_browser_interop.src.window;

import 'package:js/js.dart';

import 'document.dart';

//-----------------------------------------------------------
// Window
//-----------------------------------------------------------

/// The [Window] interface represents a window containing a DOM document; the
/// [Window.document] property points to the DOM document loaded in that window.
///
/// The [Window] interface is home to a variety of functions, namespaces,
/// objects, and constructors which are not necessarily directly associated with
/// the concept of a user interface window. However, the Window interface is a
/// suitable place to include these items that need to be globally available.
@JS('Window')
class Window {
  /// A reference to the [Document] contained in the [Window].
  external Document get document;
}

/// The [Window] object.
external Window get window;
