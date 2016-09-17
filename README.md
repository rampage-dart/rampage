> ## 🛠 Status: Highly experimental
> `rampage` is currently an experiment to see what a modern web development
> library, built on top of Web Components, would look like in Dart using its 
> js-interop facilities. If the initial prototyping is successful then work will
> begin to solidify an API for use. Early adopters are welcome, but expect
> breakages in the API until the prototype is proven.

# rampage
Modern web development, with web components, in Dart.

## Overview

## Motivation

Dart has a long history with web components starting with
[web_ui](https://pub.dev/packages/web_ui) and then
[polymer](https://pub.dev/packages/polymer). However since
[angular](https://pub.dev/packages/angular) came about the support for modern
web components has not been pursued by the Dart team. The `dart:html` library
currently has no support for Custom Elements v1 so developers wishing to use
Web Components are unable to use Dart in their web applications.

The Dart team is also working on improving its
[JS Interop](https://github.com/dart-lang/sdk/issues/35084) and this looks
promising for supporting more modern web features. Since `rampage` does not use
`dart:html`, it provides its own wrapping of browser APIs, it may provide a
good example for this work.

## Future work

[Flutter](https://flutter.dev) early in its development had a web components
path. This was dropped for its current reactive-style views but its possible
that `rampage` could target Flutter.
