// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

@JS()
library rampage_browser_interop.src.style_sheet;

import 'package:js/js.dart';

import 'js_object.dart';

//-----------------------------------------------------------
// StyleSheet
//-----------------------------------------------------------

/// An object implementing the [StyleSheet] interface represents a single style
/// sheet.
///
/// CSS style sheets will further implement the more specialized [CssStyleSheet]
/// interface.
@JS('StyleSheet')
class StyleSheet extends JsObject {}
