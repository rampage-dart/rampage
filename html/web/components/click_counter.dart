// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:async';
import 'dart:js';

import 'package:rampage_html/browser/html.dart' hide window;
import 'package:rampage_html/html.dart';
import '../main.dart';

class ClickCounterImpl extends CustomElementImpl implements ClickCounter {
  ClickCounterImpl.fromJsObject(JsObject jsObject)
      : super.fromJsObject(jsObject) {
    final root = attachShadow();
    final template = window.document
        .querySelector<TemplateElement>('#click-counter-tmpl')!
        .cloneNode<TemplateElement>();

    root.append(template.content);
  }

  @override
  int get clicks => _clicks;

  set clicks(int value) {
    _clicks = value;

    shadowRoot!.getElementById<DivElement>('clicks')!.innerText =
        'Clicked $_clicks times!';
  }

  int _clicks = 0;

  StreamSubscription<MouseEvent>? _clickSubscription;

  @override
  void connected() {
    super.connected();

    _clickSubscription = onClick.listen((_) {
      clicks++;
    });
  }

  @override
  void disconnected() {
    super.disconnected();

    _clickSubscription!.cancel();
    _clickSubscription = null;
  }

  static void define() {
    window.customElements.define(
      'click-counter',
      _constructor,
    );
  }

  static HtmlElement _constructor(JsObject jsObject) =>
      ClickCounterImpl.fromJsObject(jsObject);
}
