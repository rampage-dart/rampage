
import 'dart:js_interop';

import 'js/wrapper.dart' as js;

/// A Dart object that wraps a [JSObject].
class JsWrapper<T extends JSObject> {
  /// Creates a [JsWrapper] around the [jsObject].
  /// 
  /// This should never be called outside of generated code.
  JsWrapper.fromJsObject(this.jsObject);

  /// The wrapped JavaScript object.
  ///
  /// This should never be accessed outside of generated code!
  final T jsObject;
}

/// A bidirectional wrapper between Dart and JavaScript.
class DartJsWrapper<T extends JSObject> implements JsWrapper<T> {
  /// Creates a [DartJsWrapper] around the [jsObject].
  /// 
  /// This should never be called outside of generated code.
  DartJsWrapper.fromJsObject(this.jsObject) {
    assert(
      (jsObject as js.DartWrapper).dartObject == null,
      'Another Dart Object is already attached to the JsObject',
    );
    (jsObject as js.DartWrapper).dartObject = toJSBox;
  }

  @override
  final T jsObject;
}

/// Constructs a [JsWrapper] from a [JSObject].
typedef JsWrapperConstructor = JsWrapper Function(JSObject jsObject);

/// Safely retrieves or creates an instance of [JsWrapper] from the [object].
///
/// Checks to see if the [object] already has a [DartWrapper.dartObject] on it.
/// If so then that is returned. Otherwise returns a new [JsWrapper] by calling
/// the [construct] function.
///
/// This should be used whenever it isn't clear if the [Object] has been
/// initialized already.
T safeJsWrapperFromObject<T extends JsWrapper>(
  JSObject object,
  JsWrapperConstructor construct,
) => ((object as js.DartWrapper).dartObject ?? construct(object)) as T;

/// Safely retrieves or creates an instance of [JsWrapper] from the [object] if
/// it is not `null`.
///
/// Checks to see if the [object] already has a [DartWrapper.dartObject] on it.
/// If so then that is returned. Otherwise returns a new [JsWrapper] by calling
/// the [construct] function.
///
/// This should be used whenever it isn't clear if the [Object?] has been
/// initialized already.
T? safeJsWrapperFromObjectNullable<T extends JsWrapper>(
  JSObject? object,
  JsWrapperConstructor construct,
) =>
    object != null ? safeJsWrapperFromObject<T>(object, construct) : null;
