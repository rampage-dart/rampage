// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/browser/html.dart' as impl;

import 'document_fragment.dart';
import 'html_element.dart';

/// The [TemplateElement] interface represents a `<template>` element.
abstract class TemplateElement extends HtmlElement {
  /// Creates a new [TemplateElement].
  factory TemplateElement() = impl.TemplateElementImpl;

  /// The `<template>` element's contents.
  DocumentFragment get content;
}
