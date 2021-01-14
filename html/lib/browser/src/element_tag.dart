// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

/// Extension for getting the `tagName` from a [JsObject] representing an
/// [Element].
extension ElementTag on JsObject {
  // Element.tagName always returns upper case tags

  /// `<body>`
  static const String body = 'BODY';

  /// `<div>`
  static const String div = 'DIV';

  /// `<slot>`
  static const String slot = 'SLOT';

  /// `<template>`
  static const String template = 'TEMPLATE';

  /// The tag name of the DOM `Element`.
  String get tagName => this['tagName'] as String;
}
