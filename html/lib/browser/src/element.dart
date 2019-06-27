// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_browser_interop/browser_interop.dart' as interop;
import 'package:rampage_html/html.dart';

import 'node.dart';

//-----------------------------------------------------------
// Element
//-----------------------------------------------------------

/// Browser implementation of [Element].
class ElementImpl<T extends interop.Element> extends NodeImpl<T>
    implements Element {
  /// Creates an instance of [ElementImpl] from the [jsObject].
  ElementImpl.fromJsObject(T jsObject) : super.fromJsObject(jsObject);

  @override
  String get tagName => jsObject.tagName;

  @override
  String get id => jsObject.id;
}

//-----------------------------------------------------------
// HtmlElement
//-----------------------------------------------------------

/// Browser implementation of [HtmlElement].
class HtmlElementImpl<T extends interop.HtmlElement> extends ElementImpl<T>
    implements HtmlElement {
  /// Creates an instance of [HtmlElementImpl] from the [jsObject].
  HtmlElementImpl.fromJsObject(T jsObject) : super.fromJsObject(jsObject);
}

//-----------------------------------------------------------
// Additional HtmlElements
//-----------------------------------------------------------

/// Browser implementation of [DivElement].
class DivElementImpl extends HtmlElementImpl<interop.DivElement>
    implements DivElement {
  /// Create an instance of [DivElementImpl].
  factory DivElementImpl() => DivElementImpl.fromJsObject(
        interop.window.document.createElement('div') as interop.DivElement,
      );

  /// Create an instance of [DivElementImpl] from the [jsObject]
  DivElementImpl.fromJsObject(interop.DivElement jsObject)
      : super.fromJsObject(jsObject);

  /// Create an instance of [DivElementImpl] from the [jsObject].
  ///
  /// This constructor should be used when its unclear if the [jsObject] has
  /// already been wrapped.
  factory DivElementImpl.safeFromJsObject(interop.DivElement jsObject) =>
      jsObject.dartObject as DivElementImpl ??
      DivElementImpl.fromJsObject(jsObject);
}
