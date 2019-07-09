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
abstract class Element implements Node, ParentNode, ChildNode, Slotable {
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

  /// Returns the name of the shadow DOM slot the element is inserted in.
  String get slot;
  set slot(String value);
}

//-----------------------------------------------------------
// HtmlElement
//-----------------------------------------------------------

/// The [HtmlElement] interface represents any HTML element.
abstract class HtmlElement implements Element {}

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

/// The [DivElement] interface represents a `<div>` element.
abstract class DivElement implements HtmlElement {
  /// Creates a new [DivElement].
  factory DivElement() = impl.DivElementImpl;
}
