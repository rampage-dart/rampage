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

/// Browser implementation of [ScriptElement].
class ScriptElementImpl extends HtmlElementImpl implements ScriptElement {
  /// Create an instance of [ScriptElementImpl].
  factory ScriptElementImpl() => ScriptElementImpl.fromJsObject(
        createElementJsObject(ElementTag.script),
      );

  /// Create an instance of [ScriptElementImpl] from the [jsObject].
  ScriptElementImpl.fromJsObject(JsObject jsObject)
      : super.fromJsObject(jsObject);

  /// Create an instance of [ScriptElementImpl] from the [jsObject].
  ///
  /// This constructor should be used when its unclear if the [jsObject] has
  /// already been wrapped.
  factory ScriptElementImpl.safeFromJsObject(JsObject jsObject) =>
      (jsObject.dartObject ?? ScriptElementImpl.fromJsObject(jsObject))
          as ScriptElementImpl;

  @override
  String get src => throw UnimplementedError('src not implemented');

  @override
  String get type => throw UnimplementedError('type not implemented');

  @override
  bool get noModule => throw UnimplementedError('noModule not implemented');

  @override
  bool get async => throw UnimplementedError('async not implemented');

  @override
  bool get defer => throw UnimplementedError('defer not implemented');
}
