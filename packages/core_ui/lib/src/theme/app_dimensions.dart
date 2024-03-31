import 'package:flutter/animation.dart';

abstract class AppDimens {
  // Common
  static const double DEFAULT_BORDER_RADIUS = 8;
  static const double DEFAULT_PAGE_PADDING = 20;
  static const double DEFAULT_CONTAINER_PADDING = 12;
  static const double DEFAULT_BORDER_THICKNESS = 1;
  static const double DEFAULT_LOADER_THICKNESS = 3;
  static const double DEFAULT_LABEL_GAP = 4;
  static const Duration DEFAULT_ANIMATION_DURATION = Duration(milliseconds: 300);
  static const Curve DEFAULT_ANIMATION_CURVE = Curves.easeOut;
  static const double DEFAULT_SMALL_ICON_SIZE = 20;
  static const double DEFAULT_LARGE_ICON_SIZE = 40;

  // Controls
  static const double DEFAULT_CONTROL_MIN_WIDTH = 200;
  static const double DEFAULT_CONTROL_HEIGHT = 50;

  // Bottom navigation bar
  static const double APP_BOTTOM_NAV_BAR_HEIGHT = 60;
  static const double APP_BOTTOM_NAV_ICON_SIZE = 25;

  // App bar
  static const double APP_BAR_HEIGHT = 50;
}
