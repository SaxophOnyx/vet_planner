import 'package:flutter/material.dart';

import '../../core_ui.dart';

abstract class AppFonts {
  static const String _interFamily = 'Inter';

  static const TextStyle inter16Regular = TextStyle(
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w400,
    fontFamily: _interFamily,
    package: kPackageName,
  );
}
