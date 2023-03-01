// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/html.dart';

import 'element_factory.dart';
import 'element_tag.dart';
import 'html_element.dart';
import 'js/script_element.dart';
import 'wrapper.dart';

/// Browser implementation of [ScriptElement].
class ScriptElementImpl extends HtmlElementImpl implements ScriptElement {
  /// Create an instance of [ScriptElementImpl].
  factory ScriptElementImpl() => ScriptElementImpl.fromJsObject(
        createElementJsObject(ElementTag.script),
      );

  /// Create an instance of [ScriptElementImpl] from the [jsObject].
  ScriptElementImpl.fromJsObject(super.jsObject) : super.fromJsObject();

  @override
  String get src => jsObject.src;

  @override
  String get type => jsObject.type;

  @override
  bool get noModule => jsObject.noModule;

  @override
  bool get async => jsObject.async;

  @override
  bool get defer => jsObject.defer;
}

/// Create an instance of [ScriptElement] from the [object].
///
/// This should be used when its unclear if the [object] has already been
/// wrapped.
ScriptElement safeScriptElementFromObject(Object object) =>
    safeJsWrapperFromObject<ScriptElementImpl>(
      object,
      ScriptElementImpl.fromJsObject,
    );

/// Create an instance of [ScriptElement] from the [object]; or null otherwise.
///
/// This should be used when its unclear if the [object] has already been
/// wrapped.
ScriptElement? safeScriptElementFromObjectNullable(Object? object) =>
    safeJsWrapperFromObjectNullable<ScriptElementImpl>(
      object,
      ScriptElementImpl.fromJsObject,
    );
