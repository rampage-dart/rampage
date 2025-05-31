// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

enum DomParserSupportedType {
  textHtml('text/html'),
  textXml('text/xml'),
  applicationXml('application/xml'),
  applicationXhtmlXml('application/xhtml+xml'),
  imageSvgXml('image/svg+xml');

  const DomParserSupportedType(this.toJS);

  final String toJS;
}

@internal
extension DomParserSupportedTypeDartObject on String {
  DomParserSupportedType get toDart => switch (this) {
    'text/html' => DomParserSupportedType.textHtml,
    'text/xml' => DomParserSupportedType.textXml,
    'application/xml' => DomParserSupportedType.applicationXml,
    'application/xhtml+xml' => DomParserSupportedType.applicationXhtmlXml,
    'image/svg+xml' => DomParserSupportedType.imageSvgXml,
    _ => throw UnsupportedError(
      '$this is not a member of DomParserSupportedType',
    ),
  };
}
