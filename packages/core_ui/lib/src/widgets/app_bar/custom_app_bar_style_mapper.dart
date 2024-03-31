import 'package:flutter/material.dart';

import '../../../core_ui.dart';

abstract class CustomAppBarStyleMapper {
  static Color getBackground({required AppColors colors, required CustomAppBarStyle style}) {
    switch (style) {
      case CustomAppBarStyle.primary:
        return colors.primary;
      case CustomAppBarStyle.secondary:
        return colors.background;
    }
  }

  static Color getForeground({required AppColors colors, required CustomAppBarStyle style}) {
    switch (style) {
      case CustomAppBarStyle.primary:
        return colors.onPrimary;
      case CustomAppBarStyle.secondary:
        return colors.text;
    }
  }
}
