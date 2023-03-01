// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/html.dart';

import 'element_factory.dart';
import 'element_tag.dart';
import 'html_element.dart';
import 'wrapper.dart';

/// Browser implementation of [BodyElement].
class BodyElementImpl extends HtmlElementImpl implements BodyElement {
  /// Create an instance of [BodyElementImpl].
  factory BodyElementImpl() =>
      BodyElementImpl.fromJsObject(createElementJsObject(ElementTag.body));

  /// Create an instance of [BodyElementImpl] from the [jsObject]
  BodyElementImpl.fromJsObject(super.jsObject) : super.fromJsObject();
}

/// Safely retrieves or creates an instance of [BodyElementImpl] from the
/// [object].
BodyElementImpl safeBodyElementFromObject(Object object) =>
    safeJsWrapperFromObject<BodyElementImpl>(
      object,
      BodyElementImpl.fromJsObject,
    );

/// Safely retrieves or creates an instance of [BodyElementImpl] from the
/// [object] if it is not `null`.
BodyElementImpl? safeBodyElementFromObjectNullable(Object? object) =>
    safeJsWrapperFromObjectNullable<BodyElementImpl>(
      object,
      BodyElementImpl.fromJsObject,
    );
