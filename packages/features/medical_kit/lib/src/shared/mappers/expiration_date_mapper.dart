import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// TODO(SaxophOnyx): Use constants
abstract class ExpirationDateMapper {
  static Color getTextColor({
    required Duration remaining,
    required AppColors colors,
  }) {
    final int inDays = remaining.inDays;

    if (inDays <= 1) {
      return colors.error;
    }

    if (inDays <= 10) {
      return colors.warning;
    }

    return colors.success;
  }
}
