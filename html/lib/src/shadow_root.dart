// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'document_fragment.dart';
import 'document_or_shadow_root.dart';
import 'element.dart';

/// The [ShadowRoot] interface of the Shadow DOM API is the root node of a DOM
/// subtree that is rendered separately from a document's main DOM tree.
///
/// You can retrieve a reference to an [Element]'s shadow root using its
/// [Element.shadowRoot] property.
abstract class ShadowRoot implements DocumentFragment, DocumentOrShadowRoot {
  /// A reference to the DOM [Element] the [ShadowRoot] is attached to.
  Element get host;
}
