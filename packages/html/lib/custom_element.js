// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

class CustomElementInterop {
  constructor() {
    this.constructorCallbacks = {};
    this.connectedCallback = (d) => { throw new Error('connectedCallback not set') };
    this.disconnectedCallback = (d) => { throw new Error('disconnectedCallback not set') };
    this.attributeChangedCallback = (d, attr, oldVal, newVal) => { throw new Error('attributeChangedCallback not set') };
  }

  define(name, construct, observed) {
    let that = this;
    customElements.define(name, class extends HTMLElement {
      constructor() {
        super();
        this.$dart = construct(this);
      }
      connectedCallback() {
        that.connectedCallback(this.$dart);
      }
      disconnectedCallback() {
        that.disconnectedCallback(this.$dart);
      }
      attributeChangedCallback(attr, oldVal, newVal) {
        that.attributeChangedCallback(this.$dart, attr, oldVal, newVal);
      }
      static get observedAttributes() { return observed; }
    });
  }
}
window.CustomElementInterop = CustomElementInterop;
