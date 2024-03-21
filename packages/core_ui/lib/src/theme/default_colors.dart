import 'package:flutter/material.dart';

import 'app_colors.dart';

class DefaultColors extends AppColors {
  const DefaultColors();

  @override
  Color get background => const Color.fromARGB(255, 240, 240, 255);

  @override
  Color get container => Colors.white;

  @override
  Color get containerSecondary => const Color.fromARGB(255, 244, 244, 244);

  @override
  Color get primary => Colors.deepPurple;

  Color get onPrimary => Colors.white;

  @override
  Color get text => Colors.black;

  @override
  Color get textSecondary => const Color.fromARGB(255, 120, 120, 120);

  @override
  Color get error => Colors.red;

  @override
  Color get warning => Colors.orangeAccent;

  @override
  Color get success => Colors.green;

  @override
  Color get transparent => Colors.transparent;
}
