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
