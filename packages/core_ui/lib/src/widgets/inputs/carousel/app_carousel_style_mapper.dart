import 'package:flutter/material.dart';

import '../../../../core_ui.dart';

abstract class AppCarouselStyleMapper {
  static double getViewportFraction(AppCarouselStyle style) {
    switch (style) {
      case AppCarouselStyle.large:
        return 0.5;
      case AppCarouselStyle.small:
        return 0.25;
    }
  }

  static Color getBackgroundColor({
    required AppColors colors,
    required AppCarouselStyle style,
    required bool isSelected,
  }) {
    if (style == AppCarouselStyle.small && isSelected) {
      return colors.primary;
    }

    return colors.container;
  }

  static Color getTextColor({
    required AppColors colors,
    required AppCarouselStyle style,
    required bool isSelected,
  }) {
    if (style == AppCarouselStyle.small && isSelected) {
      return colors.onPrimary;
    }

    return colors.primary;
  }
}
