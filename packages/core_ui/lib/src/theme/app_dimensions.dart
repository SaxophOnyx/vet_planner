import 'package:flutter/animation.dart';

abstract class AppDimens {
  // Common
  static const double DEFAULT_BORDER_RADIUS = 16;
  static const double DEFAULT_PAGE_PADDING = 20;
  static const double DEFAULT_CONTAINER_PADDING = 16;
  static const double DEFAULT_BORDER_THICKNESS = 1;
  static const Duration DEFAULT_ANIMATION_DURATION = Duration(milliseconds: 300);
  static const Curve DEFAULT_ANIMATION_CURVE = Curves.easeOut;

  // Controls
  static const double DEFAULT_CONTROL_MIN_WIDTH = 200;
  static const double DEFAULT_CONTROL_HEIGHT = 60;

  // Lists
  static const double DEFAULT_LIST_ITEM_GAP = 10;

  // Bottom navigation bar
  static const double APP_BOTTOM_NAV_BAR_HEIGHT = 70;

  // App bar
  static const double APP_BAR_HEIGHT = 60;
}
