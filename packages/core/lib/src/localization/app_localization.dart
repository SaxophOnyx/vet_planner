import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';

class AppLocalization {
  static const String localeFolderPath = 'packages/core/resources/langs';

  static List<Locale> get supportedLocales => const <Locale>[
        _enLocale,
        _ruLocale,
      ];

  static Locale get fallbackLocale => _enLocale;

  static const Locale _enLocale = Locale('en', 'US');
  static const Locale _ruLocale = Locale('ru', 'RU');

  static Future<void> initialize() async {
    await EasyLocalization.ensureInitialized();
  }
}
