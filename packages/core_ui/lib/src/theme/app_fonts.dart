import 'package:flutter/material.dart';

import '../../core_ui.dart';

abstract class AppFonts {
  static const String _interFamily = 'Inter';
  static const FontWeight _regularWeight = FontWeight.w400;
  static const FontWeight _semiBoldWeight = FontWeight.w600;

  static const TextStyle inter14Regular = TextStyle(
    fontSize: 14,
    height: 1.5,
    fontWeight: _regularWeight,
    fontFamily: _interFamily,
    package: kPackageName,
  );

  static const TextStyle inter14SemiBold = TextStyle(
    fontSize: 14,
    height: 1.5,
    fontWeight: _semiBoldWeight,
    fontFamily: _interFamily,
    package: kPackageName,
  );

  static const TextStyle inter16Regular = TextStyle(
    fontSize: 16,
    height: 1.5,
    fontWeight: _regularWeight,
    fontFamily: _interFamily,
    package: kPackageName,
  );

  static const TextStyle inter18Regular = TextStyle(
    fontSize: 18,
    height: 1.5,
    fontWeight: _regularWeight,
    fontFamily: _interFamily,
    package: kPackageName,
  );

  static const TextStyle inter16SemiBold = TextStyle(
    fontSize: 16,
    height: 1.5,
    fontWeight: _semiBoldWeight,
    fontFamily: _interFamily,
    package: kPackageName,
  );

  static const TextStyle inter18SemiBold = TextStyle(
    fontSize: 18,
    height: 1.5,
    fontWeight: _semiBoldWeight,
    fontFamily: _interFamily,
    package: kPackageName,
  );

  static const TextStyle inter20SemiBold = TextStyle(
    fontSize: 20,
    height: 1.5,
    fontWeight: _semiBoldWeight,
    fontFamily: _interFamily,
    package: kPackageName,
  );

  static const TextStyle inter24SemiBold = TextStyle(
    fontSize: 24,
    height: 1.5,
    fontWeight: _semiBoldWeight,
    fontFamily: _interFamily,
    package: kPackageName,
  );
}
