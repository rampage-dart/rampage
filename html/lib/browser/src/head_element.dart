// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'element_factory.dart';
import 'element_tag.dart';
import 'html_element.dart';
import 'wrapper.dart';

/// Browser implementation of [HeadElement].
class HeadElementImpl extends HtmlElementImpl implements HeadElement {
  /// Create an instance of [HeadElementImpl].
  factory HeadElementImpl() =>
      HeadElementImpl.fromJsObject(createElementJsObject(ElementTag.head));

  /// Create an instance of [HeadElementImpl] from the [jsObject]
  HeadElementImpl.fromJsObject(JsObject jsObject)
      : super.fromJsObject(jsObject);
}

// \TODO Remove if constructor tear-offs are added to the language
HeadElementImpl _constructor(JsObject jsObject) =>
    HeadElementImpl.fromJsObject(jsObject);

/// Create an instance of [HeadElement] from the [object].
///
/// This should be used when its unclear if the [object] has already been
/// wrapped.
HeadElement safeHeadElementFromObject(Object object) =>
    safeJsWrapperFromObject<HeadElementImpl>(object, _constructor);

/// Create an instance of [HeadElement] from the [object]; or null otherwise.
///
/// This should be used when its unclear if the [object] has already been
/// wrapped.
HeadElement? safeHeadElementFromObjectNullable(Object? object) =>
    safeJsWrapperFromObjectNullable<HeadElementImpl>(object, _constructor);
