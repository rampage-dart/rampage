// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

@JS()
library rampage_browser_interop.src.dom;

import 'package:js/js.dart';

//-----------------------------------------------------------
// Node
//-----------------------------------------------------------

/// [Node] is an interface from which a number of DOM API object types inherit.
///
/// It allows those types to be treated similarly; for example, inheriting the
/// same set of methods, or being tested in the same way.
@JS('Node')
class Node {
  /// An integer that identifies what the node is.
  ///
  /// It distinguishes different kind of nodes from each other, such as
  /// elements, text and comments.
  external int get nodeType;

  /// A boolean indicating whether or not the [Node] is connected (directly or
  /// indirectly) to the context object, e.g. the [Document] object in the case
  /// of the normal DOM, or the [ShadowRoot] in the case of a shadow DOM.
  external bool get isConnected;

  /// The parent of the specified [Node] in the DOM tree.
  external Node get parentNode;

  /// The DOM [Node]'s parent [Element], or null if the node either has no
  /// parent, or its parent isn't a DOM [Element].
  external Element get parentElement;

  /// A live [NodeList] of child [Node]s of the given element where the first
  /// child [Node] is assigned index 0.
  external NodeList get childNodes;
}

/// A collections of [Node]s, usually returned by properties such as
/// [Node.childNodes] and [Document.querySelectorAll].
///
/// In some cases, the [NodeList] is live, which means that changes in the DOM
/// automatically update the collection. For example, [Node.childNodes] is live.
///
/// In other cases, the [NodeList] is static, where any changes in the DOM does
/// not affect the content of the collection. [Document.querySelectorAll]
/// returns a static [NodeList].
@JS('NodeList')
class NodeList {
  /// The number of nodes in the [NodeList].
  external int get length;

  /// Returns an item in the list by its [index], or `null` if the [index] is
  /// out-of-bounds.
  external Node item(int index);
}

/// The [ParentNode] mixin contains methods and properties that are common to
/// all types of [Node] objects that can have children.
mixin ParentNode {
  /// Returns the first [Element] with the current element as root that matches
  /// the specified group of [selectors].
  external Element querySelector(String selectors);

  /// Returns a [NodeList] representing a list of elements with the current
  /// element as root that matches the specified group of [selectors].
  external NodeList querySelectorAll(String selectors);
}

//-----------------------------------------------------------
// Elements
//-----------------------------------------------------------

/// [Element] is the most general base class from which all objects in a
/// [Document] inherit.
///
/// It only has methods and properties common to all kinds of elements. More
/// specific classes inherit from [Element]. For example, the [HtmlElement]
/// interface is the base interface for HTML elements. Most functionality is
/// specified further down the class hierarchy.
@JS('Element')
class Element extends Node with ParentNode {
  /// The name of the tag for the given [Element].
  external String get tagName;
}

/// The [HtmlElement] interface represents any HTML element.
@JS('HTMLElement')
class HtmlElement extends Element {}

/// The [UnknownElement] interface represents an invalid HTML element and
/// derives from the [HtmlElement] interface, but without implementing any
/// additional properties or methods.
@JS('HTMLUnknownElement')
class UnknownElement extends HtmlElement {}

//-----------------------------------------------------------
// Document
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
@JS('DocumentFragment')
class DocumentFragment = Node with ParentNode;

/// The [ShadowRoot] interface of the Shadow DOM API is the root node of a DOM
/// subtree that is rendered separately from a document's main DOM tree.
///
/// You can retrieve a reference to an [Element]'s shadow root using its
/// [Element.shadowRoot] property, provided it was created using
/// [Element.attachShadow] with the mode option set to `open`.
@JS('ShadowRoot')
class ShadowRoot extends DocumentFragment {}

/// The [Document] interface represents any web page loaded in the browser and
/// serves as an entry point into the web page's content, which is the DOM tree.
///
/// The DOM tree includes elements such as `<body>` and `<table>`, among many
/// others. It provides functionality globally to the document, like how to
/// obtain the page's URL and create new elements in the document.
@JS('Document')
class Document extends Node with ParentNode {
  /// Directionality of the text of the [Document], whether left to right
  /// (default) or right to left.
  ///
  /// Possible values are `rtl`, right to left, and `ltr`, left to right.
  external String get dir;

  /// Creates the HTML element specified by [tagName], or an [UnknownElement] if
  /// [tagName] isn't recognized.
  external Element createElement(String tagName);

  /// Creates a new empty [DocumentFragment].
  external DocumentFragment createDocumentFragment();
}

//-----------------------------------------------------------
// Window
//-----------------------------------------------------------

/// The [Window] interface represents a window containing a DOM document; the
/// [Window.document] property points to the DOM document loaded in that window.
///
/// The [Window] interface is home to a variety of functions, namespaces,
/// objects, and constructors which are not necessarily directly associated with
/// the concept of a user interface window. However, the Window interface is a
/// suitable place to include these items that need to be globally available.
@JS('Window')
class Window {
  /// A reference to the [Document] contained in the [Window].
  external Document get document;
}

/// The [Window] object.
external Window get window;
