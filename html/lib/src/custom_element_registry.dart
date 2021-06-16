// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'html_element.dart';

typedef CustomElementConstructor = HtmlElement Function(JsObject object);

/// The [CustomElementRegistry] interface provides methods for registering
/// [CustomElement]s and querying registered elements.
///
/// To get an instance of it, use the [Window.customElements] property.
abstract class CustomElementRegistry {
  /// Defines a new [CustomElement].
  void define(
    String name,
    CustomElementConstructor constructor, [
    List<String>? attributes,
  ]);

  /// Returns `true` if a [CustomElement] with the [name] has been registered,
  /// `false` otherwise.
  bool isDefined(String name);
}
