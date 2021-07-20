import 'dart:js';

extension JsObjectCallMethods on JsObject {
  T callMethod0<T>(String method) => callMethod(method) as T;

  T callMethod1<T>(String method, Object? arg0) =>
      callMethod(method, <Object?>[arg0]) as T;

  T callMethod2<T>(String method, Object? arg0, Object? arg1) =>
      callMethod(method, <Object?>[arg0, arg1]) as T;

  T callMethod3<T>(String method, Object? arg0, Object? arg1, Object? arg2) =>
      callMethod(method, <Object?>[arg0, arg1, arg2]) as T;

  T callMethod4<T>(
    String method,
    Object? arg0,
    Object? arg1,
    Object? arg2,
    Object? arg3,
  ) =>
      callMethod(method, <Object?>[arg0, arg1, arg2, arg3]) as T;
}
