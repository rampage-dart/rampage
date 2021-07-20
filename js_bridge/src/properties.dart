// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

///
extension JsObjectProperties on JsObject {
  /// Retrieve a boolean value from the [property].
  bool boolean(String property) => this[property] as bool;

  /// Set a boolean [value] on the [property].
  // ignore: avoid_positional_boolean_parameters
  void setBoolean(String property, bool value) {
    this[property] = value;
  }

  /// Retrieve an integer value from the [property].
  int integer(String property) => this[property] as int;

  /// Set an integer [value] on the [property].
  void setInteger(String property, int value) {
    this[property] = value;
  }

  /// Retrieve a double value from the [property].
  double number(String property) => this[property] as double;

  /// Set a double [value] on the [property].
  void setNumber(String property, double value) {
    this[property] = value;
  }

  /// Retrieves a string value from the [property].
  String string(String property) => this[property] as String;

  /// Set a string [value] on the [property].
  void setString(String property, String value) {
    this[property] = value;
  }

  /// Retrieves a string value or `null` from the [property].
  String? stringNullable(String property) => this[property] as String?;

  /// Retrieves a [JsFunction] from the [property].
  JsFunction function(String property) => this[property] as JsFunction;

  /// Retrieves a [JsArray] from the [property].
  JsArray<T> array<T>(String property) => this[property] as JsArray<T>;

  /// Retrieves a [JsObject] from the [property].
  JsObject browserObject(String property) =>
      JsObject.fromBrowserObject(this[property] as Object);

  /// Retrieves a [JsObject] or `null` from the [property].
  JsObject? browserObjectNullable(String property) {
    final Object? object = this[property];
    if (object == null) {
      return null;
    }

    return JsObject.fromBrowserObject(object);
  }
}
