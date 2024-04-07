import 'package:flutter/material.dart';

import 'app_colors.dart';

class DefaultColors extends AppColors {
  const DefaultColors();

  @override
  Color get background => const Color(0xFFF9F9F9);

  @override
  Color get backgroundSecondary => Colors.white;

  @override
  Color get primary => const Color(0xFF6E41E2);

  @override
  Color get onPrimary => Colors.white;

  @override
  Color get text => Colors.black;

  @override
  Color get textSecondary => const Color(0xFFB4B4B4);

  @override
  Color get error => Colors.red;

  @override
  Color get warning => Colors.orangeAccent;

  @override
  Color get success => Colors.green;

  @override
  Color get transparent => Colors.transparent;

  @override
  Color get barrier => Colors.black26;
}
