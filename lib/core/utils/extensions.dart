import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';


extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return empty;
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return zero;
    } else {
      return this!;
    }
  }
}

extension WidgetExtension on Widget? {
  /// add tap to parent widget
  Widget onTap(
      Function? function, {
        BorderRadius borderRadius = const BorderRadius.all(Radius.circular(0)),
        Color? splashColor,
      }) {
    return InkWell(
      onTap: function as void Function()?,
      borderRadius: borderRadius,
      child: this,
      splashColor: splashColor,
    );
  }
}

