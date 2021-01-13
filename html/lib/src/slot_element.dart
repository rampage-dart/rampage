// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/browser/html.dart' as impl;

import 'element.dart';
import 'html_element.dart';

/// The [SlotElement] interface of the Shadow DOM API enables access to the name
/// and assigned nodes of an HTML <slot> element.
abstract class SlotElement implements HtmlElement {
  /// Creates a new [SlotElement].
  factory SlotElement() = impl.SlotElementImpl;

  /// Can be used to get and set the slot's name.
  String get name;
  set name(String value);

  /// Returns the elements assigned to this slot (and no other nodes).
  ///
  /// If the flatten option is set to `true`, it also returns the assigned
  /// elements of any other slots that are descendants of this slot. If no
  /// assigned nodes are found, it returns the slot's fallback content.
  Iterable<Element> assignedElements({bool flatten = false});
}
