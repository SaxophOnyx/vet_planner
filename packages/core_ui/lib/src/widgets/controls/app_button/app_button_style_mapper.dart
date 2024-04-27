import 'package:flutter/material.dart';

import '../../../../core_ui.dart';

abstract class AppButtonStyleMapper {
  static Color getBackground({required AppColors colors, required AppButtonStyle style}) {
    switch (style) {
      case AppButtonStyle.primary:
        return colors.primary;
      case AppButtonStyle.secondary:
        return colors.container;
    }
  }

  static Color getText({required AppColors colors, required AppButtonStyle style}) {
    switch (style) {
      case AppButtonStyle.primary:
        return colors.onPrimary;
      case AppButtonStyle.secondary:
        return colors.textSecondary;
    }
  }

  static Color getBorder({required AppColors colors, required AppButtonStyle style}) {
    switch (style) {
      case AppButtonStyle.primary:
        return colors.primary;
      case AppButtonStyle.secondary:
        return colors.textSecondary;
    }
  }
}
