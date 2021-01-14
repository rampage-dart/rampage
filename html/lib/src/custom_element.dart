// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

import 'html_element.dart';

/// [CustomElement]s provide a way for authors to build their own fully-featured
/// DOM elements.
abstract class CustomElement implements HtmlElement {
  /// Callback for when the [CustomElement] is connected.
  @protected
  void connected();

  /// Callback for when the [CustomElement] is disconnected.
  @protected
  void disconnected();

  /// Callback for when the attribute changes its value.
  @protected
  void attributeChanged(String name, String? oldValue, String? newValue);
}
