// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

/// Extension for getting the `tagName` from a [JsObject] representing an
/// [Element].
extension ElementTag on JsObject {
  /// `<body>`
  static const String body = 'body';
  /// `<div>`
  static const String div = 'div';
  /// `<slot>`
  static const String slot = 'slot';
  /// `<template>`
  static const String template = 'template';

  /// The tag name of the DOM `Element`.
  String get tagName => this['tagName'] as String;
}
