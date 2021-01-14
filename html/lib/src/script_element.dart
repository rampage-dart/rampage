// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/browser/html.dart' as impl;

import 'html_element.dart';

/// The [ScriptElement] interface represents a `<script>` element.
abstract class ScriptElement extends HtmlElement {
  /// Creates a new [ScriptElement].
  factory ScriptElement() = impl.ScriptElementImpl;

  /// The URL of an external script.
  ///
  /// It reflects the `src` attribute.
  String get src;

  /// The MIME type of the script.
  ///
  /// It reflects the `type` attribute.
  String get type;

  /// If `true`, stops the script's execution in browsers that support ES2015
  /// modules.
  bool get noModule;

  /// Whether execution of the script should happen asynchrounously as soon as
  /// it is downloaded.
  bool get async;

  /// Whether execution of the script should be deferred until after the page is
  /// loaded.
  bool get defer;
}
