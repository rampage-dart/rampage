// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

@JS()
library rampage_browser_interop.src.document;

import 'package:js/js.dart';

import 'attribute.dart';
import 'element.dart';
import 'node.dart';

//-----------------------------------------------------------
// DomParser
//-----------------------------------------------------------

/// The [DomParser] interface provides the ability to parse XML or HTML source
/// code from a string into a DOM [Document].
@JS('DOMParser')
class DomParser {
  /// Returns a [Document] from the [string] with the given [mimeType].
  external Document parseFromString(String string, String mimeType);
}

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
@JS('DocumentFragment')
class DocumentFragment = Node with ParentNode;

//-----------------------------------------------------------
// ShadowRoot
//-----------------------------------------------------------

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

//-----------------------------------------------------------
// Document
//-----------------------------------------------------------

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

  /// Represents the `<body>` of the current [Document], or `null` if no such
  /// [Element] exists.
  external BodyElement get body;

  /// Creates the HTML element specified by [tagName], or an [UnknownElement] if
  /// [tagName] isn't recognized.
  external Element createElement(String tagName);

  /// Creates a new [Attribute] object and returns it.
  external Attribute createAttribute(String name);

  /// Creates a new empty [DocumentFragment].
  external DocumentFragment createDocumentFragment();
}
