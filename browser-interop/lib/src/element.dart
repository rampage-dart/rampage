// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

@JS()
library rampage_browser_interop.src.element;

import 'package:js/js.dart';

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

//-----------------------------------------------------------
// HtmlElement
//-----------------------------------------------------------

/// The [HtmlElement] interface represents any HTML element.
@JS('HTMLElement')
class HtmlElement extends Element {}

//-----------------------------------------------------------
// TemplateElement
//-----------------------------------------------------------

/// The [TemplateElement] interface represents a `<template>` element.
@JS('HTMLTemplateElement')
class TemplateElement extends HtmlElement {
  /// The `<template>` element's contents.
  external DocumentFragment get content;
}

//-----------------------------------------------------------
// Additional HtmlElements
//-----------------------------------------------------------

/// The [DivElement] interface represents a `<div>` element.
@JS('HTMLDivElement')
class DivElement extends HtmlElement {}

/// The [UnknownElement] interface represents an invalid HTML element and
/// derives from the [HtmlElement] interface, but without implementing any
/// additional properties or methods.
@JS('HTMLUnknownElement')
class UnknownElement extends HtmlElement {}
