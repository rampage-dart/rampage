// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/browser/html.dart' as impl;

import 'html_element.dart';

/// The [ImageElement] interface represents an HTML `<img>` element, providing
/// the properties and methods used to manipulate image elements.
abstract class ImageElement extends HtmlElement {
  /// Creates a new [ImageElement].
  factory ImageElement() = impl.ImageElementImpl;

  /// The `src` HTML attribute, which contains the full URL of the image
  /// including base URI.
  ///
  /// You can load a different image into the element by changing the URL in
  /// the `src` attribute.
  String get src;
  set src(String value);

  /// The `width` HTML attribute, indicating the rendered width of the image
  /// in CSS pixels.
  int get width;
  set width(int value);

  /// The `height` HTML attribute, indicating the rendered height of the image
  /// in CSS pixels.
  int get height;
  set height(int value);

  /// The intrinsic width of the image in CSS pixels, if it is available;
  /// otherwise, it will show `0`.
  ///
  /// This is the width the image would be if it were rendered at its natural
  /// full size.
  int get naturalWidth;

  /// The intrinsic height of the image in CSS pixels, if it is available;
  /// otherwise, it will show `0`.
  ///
  /// This is the height the image would be if it were rendered at its natural
  /// full size.
  int get naturalHeight;

  /// Returns a [Future] that resolves when the image is decoded and it's safe
  /// to append the image to the DOM.
  ///
  /// This prevents rendering of the next frame from having to pause to decode
  /// the image, as would happen if an undecoded image were added to the DOM.
  Future<void> decode();
}
