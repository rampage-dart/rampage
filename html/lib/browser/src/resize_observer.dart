// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:async';
import 'dart:html';
import 'dart:js';

import 'package:rampage_html/html.dart';

import 'wrapper.dart';

/// Browser implementation of [ResizeObserver].
class ResizeObserverImpl extends JsWrapper implements ResizeObserver {
  /// Create an instance of [ResizeObserverImpl].
  factory ResizeObserverImpl() =>
      throw UnimplementedError('ResizeObserverImpl not implemented');

  /// Create an instance of [ResizeObserverImpl] from the [jsObject].
  ResizeObserverImpl.fromJsObject(JsObject jsObject)
      : super.fromJsObject(jsObject);

  @override
  Stream<ResizeObserverEntry> get onResize =>
      throw UnimplementedError('onResize not implemented');

  @override
  void observe(Element element) =>
      throw UnimplementedError('observe not implemented');

  @override
  void unobserve(Element element) =>
      throw UnimplementedError('unobserve not implemented');

  @override
  void disconnect() => throw UnimplementedError('disconnect not implemented');
}

/// Browser implementation of [ResizeObserverEntryImpl].
class ResizeObserverEntryImpl extends JsWrapper implements ResizeObserverEntry {
  /// Create an instance of [ResizeObserverEntryImpl].
  ResizeObserverEntryImpl.fromJsObject(JsObject jsObject)
      : super.fromJsObject(jsObject);

  @override
  Element get target => throw UnimplementedError('target not implemented');

  @override
  ImmutableRectangle get contentRect =>
      throw UnimplementedError('contentRect not implemented');
}
