// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

/// An old-style collection.
///
/// A collection is an object that represents a list of nodes. A collection can
/// be either live or static. Unless otherwise stated, a collection must be
/// live.
///
/// This is a historic artifact that cannot be removed.
extension CollectionJsObject on JsObject {
  /// Returns the node at the [index] of the collection; `null` otherwise.
  Object? item(int index) => callMethod('item', <Object?>[index]);

  /// The number of nodes represented by the collection.
  int get length => this['length'] as int;
}
