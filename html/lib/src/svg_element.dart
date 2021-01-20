// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'element.dart';
import 'global_event_handlers.dart';
import 'html_or_svg_element.dart';

/// The [SvgElement] interface represents any HTML element.
abstract class SvgElement
    implements Element, HtmlOrSvgElement, GlobalEventHandlers {}
