// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

import 'element_tag.dart' as tag;
import 'html_element.dart';
import 'js_interop/document.dart' as js;
import 'js_interop/slot_element.dart' as js;
import 'wrapper.dart';

final class SlotElement extends HtmlElement<js.HTMLSlotElement> {
  factory SlotElement() => SlotElement.fromJsObject(
    js.document.createElement(tag.slot) as js.HTMLSlotElement,
  );

  @protected
  SlotElement.fromJsObject(super.jsObject) : super.fromJsObject();

  String get name => jsObject.name;
  set name(String value) {
    jsObject.name = value;
  }
}

@internal
SlotElement safeSlotElementFromObject(js.HTMLSlotElement jsObject) =>
    safeJsWrapperFromJsObject<js.HTMLSlotElement>(
          jsObject,
          SlotElement.fromJsObject,
        )
        as SlotElement;

@internal
SlotElement? safeSlotElementFromObjectNullable(js.HTMLSlotElement? object) =>
    safeJsWrapperFromJsObjectNullable<js.HTMLSlotElement>(
          object,
          SlotElement.fromJsObject,
        )
        as SlotElement;
