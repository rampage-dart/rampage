import 'dart:js_interop';

/// A JavaScript object that wraps a Dart object.
extension type DartWrapper(JSObject _) implements JSObject {
  @JS(r'$dart')
  external JSBoxedDartObject? dartObject;
}
