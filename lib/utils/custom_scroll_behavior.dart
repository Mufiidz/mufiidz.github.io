import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomScrollBeahvior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices {
    return PointerDeviceKind.values.toSet();
  }
}