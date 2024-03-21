import 'package:flutter/material.dart';

import 'app_colors.dart';

extension AppColorsThemeExtension on BuildContext {
  AppColors get appColors {
    final AppColors? colors = Theme.of(this).extension<AppColors>();
    assert(colors != null, 'AppColors not found in this BuildContext');
    return colors!;
  }
}
