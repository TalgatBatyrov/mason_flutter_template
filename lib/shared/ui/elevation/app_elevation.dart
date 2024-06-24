import 'package:flutter/material.dart';

abstract class AppElevation {
  static const smallDark = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.25),
    blurRadius: 15,
    offset: Offset(0, 4),
  );
}
