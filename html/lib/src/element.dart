// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/browser/html.dart' as impl;

import 'child_node.dart';
import 'document.dart';
import 'node.dart';
import 'non_document_type_child_node.dart';
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
abstract class Element
    implements Node, ParentNode, ChildNode, NonDocumentTypeChildNode, Slotable {
  /// Creates a [DivElement].
  factory Element.div() = DivElement;

  /// Creates a [SlotElement].
  factory Element.slot() = SlotElement;

  /// Creates a [TemplateElement].
  factory Element.template() = TemplateElement;

  /// Creates an [Element] from the [tagName].
  factory Element.tag(String tagName) => impl.createElement(tagName);

  /// The name of the tag for the given [Element].
  String get tagName;

  /// The identifier of the [Element].
  String get id;
  set id(String value);

  /// All attributes for the [Element].
  Map<String, String> get attributes;

  /// Returns the name of the shadow DOM slot the element is inserted in.
  String get slot;
  set slot(String value);

  /// The open [ShadowRoot] that is hosted by the [Element], or `null` if no
  /// open [ShadowRoot] is present.
  ShadowRoot get shadowRoot;

  /// Attatches a shadow DOM tree to the specified element and returns a
  /// reference to its [ShadowRoot].
  ShadowRoot attachShadow();
}

//-----------------------------------------------------------
// HtmlElement
//-----------------------------------------------------------

/// The [HtmlElement] interface represents any HTML element.
abstract class HtmlElement implements Element {
  /// Represents the "rendered" text content of a node and its descendants. As a
  /// getter, it approximates the text the user would get if they highlighted
  /// the contents of the element with the cursor and then copied it to the
  /// clipboard.
  String get innerText;
  set innerText(String value);
}

//-----------------------------------------------------------
// SlotElement
//-----------------------------------------------------------

/// The [SlotElement] interface of the Shadow DOM API enables access to the name
/// and assigned nodes of an HTML <slot> element.
abstract class SlotElement implements HtmlElement {
  /// Creates a new [SlotElement].
  factory SlotElement() = impl.SlotElementImpl;

  /// Can be used to get and set the slot's name.
  String get name;
  set name(String value);
}

//-----------------------------------------------------------
// TemplateElement
//-----------------------------------------------------------

/// The [TemplateElement] interface represents a `<template>` element.
abstract class TemplateElement extends HtmlElement {
  /// Creates a new [TemplateElement].
  factory TemplateElement() = impl.TemplateElementImpl;

  /// The `<template>` element's contents.
  DocumentFragment get content;
}

//-----------------------------------------------------------
// Additional HtmlElements
//-----------------------------------------------------------

/// The [BodyElement] interface represents a `<body>` element.
abstract class BodyElement extends HtmlElement {
  /// Creates a new [BodyElement].
  factory BodyElement() = impl.BodyElementImpl;
}

/// The [DivElement] interface represents a `<div>` element.
abstract class DivElement implements HtmlElement {
  /// Creates a new [DivElement].
  factory DivElement() = impl.DivElementImpl;
}
