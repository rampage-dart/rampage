// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

@JS()
library rampage_browser_interop.src.attribute;

import 'package:js/js.dart';

import 'element.dart';
import 'js_object.dart';

//-----------------------------------------------------------
// NamedNodeMap
//-----------------------------------------------------------

/// A collection of [Attribute] objects.
@JS('NamedNodeMap')
class NamedNodeMap {
  /// The amount of [Attribute]s in the map
  external int get length;

  /// Returns the [Attribute] at the given [index], or `null` if the index is
  /// higher or equal to the number of nodes.
  external Attribute item(int index);

  /// Returns an [Attribute], corresponding to the given [name].
  external Attribute getNamedItem(String name);

  /// Replaces, or adds, the [Attribute] identified in the map by the given
  /// [Attribute.name].
  external Attribute setNamedItem(Attribute attribute);

  /// Removes the [Attribute] identified by the given [name].
  external Attribute removeNamedItem(String name);
}

//-----------------------------------------------------------
// Attribute
//-----------------------------------------------------------

/// The [Attribute] interface represents one of a DOM element's attributes as an
/// object.
@JS('Attr')
class Attribute extends JsObject {
  /// The attribute's name.
  external String get name;

  /// The attribute's value.
  external String get value;
  external set value(String value);

  /// The [Element] holding the attribute.
  external Element get ownerElement;
}
