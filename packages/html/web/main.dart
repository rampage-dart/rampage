// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:async';

import 'package:rampage_html/html.dart';

class ClickCounter extends CustomElement {
  factory ClickCounter() => Element.tag('click-counter') as ClickCounter;

  ClickCounter.fromJsObject(super.jsObject) : super.fromJsObject() {
    final content = window.document
        .querySelector<TemplateElement>('#click-counter-tmpl')!
        .content;

    final root = attachShadow(mode: ShadowRootMode.open);
    root.append(content.cloneNode());
  }

  int _clicks = 0;

  StreamSubscription<MouseEvent>? _clickSubscription;

  int get clicks => _clicks;

  set clicks(int value) {
    _clicks = value;

    shadowRoot!.getElementById<DivElement>('clicks')!.innerText =
        'Clicked $_clicks times!';
  }

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
    window.customElements.define('click-counter', ClickCounter.fromJsObject);
  }
}

Future<void> main() async {
  ClickCounter.define();

  window.document.body!.append(ClickCounter());
}
