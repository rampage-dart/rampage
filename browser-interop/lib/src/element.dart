// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

@JS()
library rampage_browser_interop.src.element;

import 'package:js/js.dart';

import 'attribute.dart';
import 'child_node.dart';
import 'document.dart';
import 'node.dart';
import 'parent_node.dart';
import 'slotable.dart';

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
class Element extends Node with ParentNode, ChildNode, Slotable {
  /// The name of the tag for the given [Element].
  external String get tagName;

  /// The identifier of the [Element].
  external String get id;
  external set id(String value);

  /// Returns the name of the shadow DOM slot the element is inserted in.
  external String get slot;
  external set slot(String value);

  /// The assigned [Attribute]s.
  external NamedNodeMap get attributes;

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
class HtmlElement extends Element {
  /// Represents the "rendered" text content of a node and its descendants. As a
  /// getter, it approximates the text the user would get if they highlighted
  /// the contents of the element with the cursor and then copied it to the
  /// clipboard.
  external String get innerText;
  external set innerText(String value);
}

//-----------------------------------------------------------
// SlotElement
//-----------------------------------------------------------

/// The [SlotElement] interface of the Shadow DOM API enables access to the name
/// and assigned nodes of an HTML <slot> element.
@JS('HTMLSlotElement')
class SlotElement extends HtmlElement {
  /// Can be used to get and set the slot's name.
  external String get name;
  external set name(String value);

  /// Returns a sequence of the [Node]s assigned to this slot, and if the
  /// flatten option is set to `true`, the assigned nodes of any other slots
  /// that are descendants of this slot.
  ///
  /// If no assigned nodes are found, it returns the slot's fallback content.
  external List<Node> assignedNodes([AssignedNodeOptions options]);

  /// Returns a sequence of the [Element]s assigned to this slot (and no other
  /// [Node]s). If the flatten option is set to true, it also returns the
  /// assigned [Element]s of any other slots that are descendants of this slot.
  ///
  /// If no assigned nodes are found, it returns the slot's fallback content.
  external List<Element> assignedElements([AssignedNodeOptions options]);
}

/// Represents options for getting assigned [Node]s and [Element]s within a
/// [SlotElement].
@JS()
@anonymous
class AssignedNodeOptions {
  /// Creates the [AssignedNodeOptions].
  external factory AssignedNodeOptions({bool flatten = false});

  /// Whether to return the assigned [Node]s of any available child <slot>
  /// [Element]s (`true`) or not (`false`). Defaults to false.
  external bool get flatten;
  external set flatten(bool value);
}

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

/// The [BodyElement] interface represents a `<body>` element.
@JS('HTMLBodyElement')
class BodyElement extends HtmlElement {}

/// The [DivElement] interface represents a `<div>` element.
@JS('HTMLDivElement')
class DivElement extends HtmlElement {}

/// The [UnknownElement] interface represents an invalid HTML element and
/// derives from the [HtmlElement] interface, but without implementing any
/// additional properties or methods.
@JS('HTMLUnknownElement')
class UnknownElement extends HtmlElement {}
