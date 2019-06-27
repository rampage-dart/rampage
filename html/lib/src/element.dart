// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/browser/html.dart' as impl;

import 'document.dart';
import 'node.dart';

//-----------------------------------------------------------
// Element
//-----------------------------------------------------------

/// [Element] is the most general base class from which all objects in a
/// [Document] inherit.
///
/// It only has methods and properties common to all kinds of elements. More
/// specific classes inherit from [Element]. For example, the [HtmlElement]
/// interface is the base interface for HTML elements. Most functionality is
/// specified further down the class hierarchy.
abstract class Element implements Node {
  /// Creates a [DivElement].
  factory Element.div() = DivElement;

  /// The name of the tag for the given [Element].
  String get tagName;

  /// The identifier of the [Element].
  String get id;
}

//-----------------------------------------------------------
// HtmlElement
//-----------------------------------------------------------

/// The [HtmlElement] interface represents any HTML element.
abstract class HtmlElement implements Element {}

//-----------------------------------------------------------
// Additional HtmlElements
//-----------------------------------------------------------

/// The [DivElement] interface represents a `<div>` element.
abstract class DivElement implements HtmlElement {
  /// Creates a new [DivElement].
  factory DivElement() = impl.DivElementImpl;
}
