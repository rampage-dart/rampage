// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

@JS()
library rampage_browser_interop.src.js_object;

import 'package:js/js.dart';

/// Base class for all JavaScript objects.
@JS()
@anonymous
class JsObject {
  // TODO: Investigate using extension methods for this rather than having
  //       `dartObject` on the base class

  /// A reference to the Dart [Object] that is associated with this [JsObject].
  external Object get dartObject;
  external set dartObject(Object object);
}
