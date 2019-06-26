// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

@JS()
library rampage_browser_interop.src.dom;

import 'package:js/js.dart';

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
class Element {
  /// The name of the tag for the given element
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

/// The [Document] interface represents any web page loaded in the browser and
/// serves as an entry point into the web page's content, which is the DOM tree.
///
/// The DOM tree includes elements such as `<body>` and `<table>`, among many
/// others. It provides functionality globally to the document, like how to
/// obtain the page's URL and create new elements in the document.
@JS('Document')
class Document {
  /// Directionality of the text of the [Document], whether left to right
  /// (default) or right to left.
  /// 
  /// Possible values are `rtl`, right to left, and `ltr`, left to right.
  external String get dir;

  /// Creates the HTML element specified by [tagName], or an [UnknownElement] if
  /// [tagName] isn't recognized.
  external Element createElement(String tagName);
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
