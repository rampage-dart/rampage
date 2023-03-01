// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/html.dart';

import 'element_factory.dart';
import 'element_tag.dart';
import 'html_element.dart';
import 'js/slot_element.dart';
import 'wrapper.dart';

/// Browser implementation of [SlotElement].
class SlotElementImpl extends HtmlElementImpl implements SlotElement {
  /// Create an instance of [SlotElementImpl].
  factory SlotElementImpl() =>
      SlotElementImpl.fromJsObject(createElementJsObject(ElementTag.slot));

  /// Create an instance of [SlotElementImpl] from the [jsObject].
  SlotElementImpl.fromJsObject(super.jsObject) : super.fromJsObject();

  @override
  String get name => jsObject.name;
  @override
  set name(String value) {
    jsObject.name = value;
  }

  @override
  Iterable<Element> assignedElements({bool flatten = false}) =>
      throw UnimplementedError('assignedElements not implemented');
}

/// Safely retrieves or creates an instance of [SlotElementImpl] from the
/// [object].
SlotElementImpl safeSlotElementFromObject(Object object) =>
    safeJsWrapperFromObject<SlotElementImpl>(
      object,
      SlotElementImpl.fromJsObject,
    );

/// Safely retrieves or creates an instance of [SlotElementImpl] from the
/// [object] if it is not `null`.
SlotElementImpl? safeSlotElementFromObjectNullable(Object? object) =>
    safeJsWrapperFromObjectNullable<SlotElementImpl>(
      object,
      SlotElementImpl.fromJsObject,
    );
