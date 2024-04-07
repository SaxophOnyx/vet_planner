import 'package:flutter/material.dart';

abstract class AppColors extends ThemeExtension<AppColors> {
  const AppColors();

  Color get background;

  Color get backgroundSecondary;

  Color get primary;

  Color get onPrimary;

  Color get text;

  Color get textSecondary;

  Color get error;

  Color get warning;

  Color get success;

  Color get transparent;

  Color get barrier;

  @override
  ThemeExtension<AppColors> copyWith() => throw UnimplementedError();

  @override
  ThemeExtension<AppColors> lerp(covariant ThemeExtension<AppColors>? other, double t) => throw UnimplementedError();
}
