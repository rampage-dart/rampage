// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/browser/html.dart' as impl;

import 'body_element.dart';
import 'child_node.dart';
import 'div_element.dart';
import 'document.dart';
import 'node.dart';
import 'non_document_type_child_node.dart';
import 'parent_node.dart';
import 'shadow_root.dart';
import 'slot_element.dart';
import 'slotable.dart';
import 'template_element.dart';

/// [Element] is the most general base class from which all objects in a
/// [Document] inherit.
///
/// It only has methods and properties common to all kinds of elements. More
/// specific classes inherit from [Element]. For example, the [HtmlElement]
/// interface is the base interface for HTML elements. Most functionality is
/// specified further down the class hierarchy.
abstract class Element
    implements Node, ParentNode, ChildNode, NonDocumentTypeChildNode, Slotable {
  /// Creates a [BodyElement].
  factory Element.body() = BodyElement;

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

  String get className;
  set className(String value);

  /// All attributes for the [Element].
  Map<String, String> get attributes;

  /// Returns the name of the shadow DOM slot the element is inserted in.
  String get slot;
  set slot(String value);

  /// The open [ShadowRoot] that is hosted by the [Element], or `null` if no
  /// open [ShadowRoot] is present.
  ShadowRoot? get shadowRoot;

  /// Attaches a shadow DOM tree to the specified element and returns a
  /// reference to its [ShadowRoot].
  ShadowRoot attachShadow();
}
