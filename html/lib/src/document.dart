// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'document_fragment.dart';
import 'element.dart';
import 'node.dart';
import 'non_element_parent_node.dart';
import 'parent_node.dart';

//-----------------------------------------------------------
// ShadowRoot
//-----------------------------------------------------------

/// The [ShadowRoot] interface of the Shadow DOM API is the root node of a DOM
/// subtree that is rendered separately from a document's main DOM tree.
///
/// You can retrieve a reference to an [Element]'s shadow root using its
/// [Element.shadowRoot] property.
abstract class ShadowRoot implements DocumentFragment {
  /// A reference to the DOM [Element] the [ShadowRoot] is attached to.
  Element get host;
}

//-----------------------------------------------------------
// Document
//-----------------------------------------------------------

/// The [Document] interface represents any web page loaded in the browser and
/// serves as an entry point into the web page's content, which is the DOM tree.
abstract class Document implements Node, ParentNode, NonElementParentNode {
  /// Represents the `<body>` of the current [Document], or `null` if no such
  /// [Element] exists.
  BodyElement get body;
}
