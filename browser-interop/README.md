> ## 🛠 Status: Highly experimental
> `rampage` is currently an experiment to see what a modern web development
> library, built on top of Web Components, would look like in Dart using its 
> js-interop facilities. If the initial prototyping is successful then work will
> begin to solidify an API for use. Early adopters are welcome, but expect
> breakages in the API until the prototype is proven.

# rampage_browser_interop
Dart and JavaScript interoperability for web browser APIs.

[![pub package](https://img.shields.io/pub/v/rampage_browser_interop.svg)](https://pub.dev/packages/rampage_browser_interop)

## Overview
`rampage_browser_interop` is a translation of web browser APIs into `package:js`
interoperability classes. It is not meant to wrap all browser APIs just those
relevant for `rampage`. It does not provide a friendlier API over the
browser APIs, like `dart:html` does, instead it is a one to one mapping of the
APIs into Dart. A friendlier API is provided by `rampage_html` which is meant
more as a `dart:html` replacement.

The focus of `rampage_browser_interop` is modern browser APIs. If there is a
more modern browser API available that will be wrapped while the legacy one will
not be provided. This is to simplify the interoperability classes and push
developers to use more modern and efficient browser constructs.

## Future Work
Currently all the Dart interoperability classes are all hand made. Browser APIs
are defined in [WebIDL](https://heycam.github.io/webidl) so in the future it
would be ideal to use those definitions to generate Dart code.
