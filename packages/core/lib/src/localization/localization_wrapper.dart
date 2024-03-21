import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app_localization.dart';

class LocalizationWrapper extends StatelessWidget {
  final Widget Function(BuildContext context) builder;

  const LocalizationWrapper({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: AppLocalization.supportedLocales,
      path: AppLocalization.localeFolderPath,
      fallbackLocale: AppLocalization.fallbackLocale,
      child: Builder(
        builder: (BuildContext context) {
          return builder(context);
        },
      ),
    );
  }
}
