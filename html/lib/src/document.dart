// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'element.dart';
import 'node.dart';
import 'non_element_parent_node.dart';
import 'parent_node.dart';

//-----------------------------------------------------------
// DocumentFragment
//-----------------------------------------------------------

/// The [DocumentFragment] interface represents a minimal document object that
/// has no parent.
///
/// It is used as a lightweight version of [Document] that stores a segment of a
/// document structure comprised of nodes just like a standard document. The key
/// difference is that because the document fragment isn't part of the active
/// document tree structure, changes made to the fragment don't affect the
/// document, cause reflow, or incur any performance impact that can occur when
/// changes are made.
abstract class DocumentFragment
    implements Node, ParentNode, NonElementParentNode {}

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
