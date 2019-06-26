// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

@JS()
library rampage_browser_interop.src.dom;

import 'package:js/js.dart';

import 'node.dart';

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
class Element extends Node with ParentNode, ChildNode {
  /// The name of the tag for the given [Element].
  external String get tagName;

  /// The identifier of the [Element].
  external String get id;

  /// The open [ShadowRoot] that is hosted by the [Element], or `null` if no
  /// open [ShadowRoot] is present.
  external ShadowRoot get shadowRoot;

  /// Attatches a shadow DOM tree to the specified element and returns a
  /// reference to its [ShadowRoot].
  external ShadowRoot attachShadow(ShadowRootInit shadowRootInit);
}

/// Represents options that represent characteristics of a [ShadowRoot].
@JS()
@anonymous
class ShadowRootInit {
  /// Creates the [ShadowRootInit] options.
  external factory ShadowRootInit({String mode = 'open'});

  /// Specifies the encapsulation mode for the shadow DOM tree, either `open`
  /// or `closed`.
  ///
  /// When using `open` [Element]s of the [ShadowRoot] are accessible from
  /// script outside the root.
  ///
  ///     element.shadowRoot; // Returns a ShadowRoot object
  ///
  /// When using `closed` access to the [Node]s is denied.
  ///
  ///     element.shadowRoot; // Returns null
  external String get mode;
  external set mode(String value);
}

/// The [HtmlElement] interface represents any HTML element.
@JS('HTMLElement')
class HtmlElement extends Element {}

/// The [DivElement] interface represents a `<div>` element.
@JS('HTMLDivElement')
class DivElement extends HtmlElement {}

/// The [TemplateElement] interface represents a `<template>` element.
@JS('HTMLTemplateElement')
class TemplateElement extends HtmlElement {
  /// The `<template>` element's contents.
  external DocumentFragment get content;
}

/// The [UnknownElement] interface represents an invalid HTML element and
/// derives from the [HtmlElement] interface, but without implementing any
/// additional properties or methods.
@JS('HTMLUnknownElement')
class UnknownElement extends HtmlElement {}

//-----------------------------------------------------------
// Document
//-----------------------------------------------------------

/// The [DomParser] interface provides the ability to parse XML or HTML source
/// code from a string into a DOM [Document].
@JS('DOMParser')
class DomParser {
  /// Returns a [Document] from the [string] with the given [mimeType].
  external Document parseFromString(String string, String mimeType);
}

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
class ShadowRoot extends DocumentFragment {
  /// A reference to the DOM [Element] the [ShadowRoot] is attached to.
  external Element get host;

  /// The mode of the [ShadowRoot] — either `open` or `closed`.
  ///
  /// This defines whether or not the shadow root's internal features are
  /// accessible from scripts.
  external String get mode;
}

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
