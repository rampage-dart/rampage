// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/browser/html.dart' as impl;

import 'custom_element_registry.dart';
import 'document.dart';
import 'event_target.dart';

/// The [Window] interface represents a window containing a DOM document; the
/// [Window.document] property points to the DOM document loaded in that window.
abstract class Window implements EventTarget {
  /// A reference to the [Document] contained in the [Window].
  Document get document;

  /// Returns a reference to the [CustomElementRegistry] object, which can be
  /// used to register new [CustomElement]s and get information about previously
  /// registered [CustomElement]s.
  CustomElementRegistry get customElements;
}

/// The [Window] object.
Window get window => impl.window;
