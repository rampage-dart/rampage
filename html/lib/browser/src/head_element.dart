// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

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
  HeadElementImpl.fromJsObject(super.jsObject) : super.fromJsObject();
}

/// Create an instance of [HeadElement] from the [object].
///
/// This should be used when its unclear if the [object] has already been
/// wrapped.
HeadElement safeHeadElementFromObject(Object object) =>
    safeJsWrapperFromObject<HeadElementImpl>(
      object,
      HeadElementImpl.fromJsObject,
    );

/// Create an instance of [HeadElement] from the [object]; or null otherwise.
///
/// This should be used when its unclear if the [object] has already been
/// wrapped.
HeadElement? safeHeadElementFromObjectNullable(Object? object) =>
    safeJsWrapperFromObjectNullable<HeadElementImpl>(
      object,
      HeadElementImpl.fromJsObject,
    );
