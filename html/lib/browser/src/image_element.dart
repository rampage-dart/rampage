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

/// Browser implementation of [ImageElement].
class ImageElementImpl extends HtmlElementImpl implements ImageElement {
  /// Create an instance of [ImageElementImpl].
  factory ImageElementImpl() => ImageElementImpl.fromJsObject(
        createElementJsObject(ElementTag.image),
      );

  /// Create an instance of [ImageElementImpl] from the [jsObject].
  ImageElementImpl.fromJsObject(JsObject jsObject)
      : super.fromJsObject(jsObject);

  /// Create an instance of [ImageElementImpl] from the [jsObject].
  ///
  /// This constructor should be used when its unclear if the [jsObject] has
  /// already been wrapped.
  factory ImageElementImpl.safeFromJsObject(JsObject jsObject) =>
      (jsObject.dartObject ?? ImageElementImpl.fromJsObject(jsObject))
          as ImageElementImpl;

  @override
  String get src => throw UnimplementedError('src not implemented');
  @override
  set src(String value) => throw UnimplementedError('src not implemented');

  @override
  int get width => throw UnimplementedError('width not implemented');
  @override
  set width(int value) => throw UnimplementedError('width not implemented');

  @override
  int get height => throw UnimplementedError('height not implemented');
  @override
  set height(int value) => throw UnimplementedError('height not implemented');

  @override
  int get naturalWidth =>
      throw UnimplementedError('naturalWidth not implemented');

  @override
  int get naturalHeight =>
      throw UnimplementedError('naturalHeight not implemented');

  @override
  Future<void> decode() => throw UnimplementedError('decode not implemented');
}
