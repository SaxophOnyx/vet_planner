import 'dart:ui';
import 'package:core/core.dart';

abstract class LocaleMapper {
  static String getLanguageLocaleKey(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return LocaleKeys.settings_lang_en;
      case 'ru':
        return LocaleKeys.settings_lang_ru;
      default:
        throw UnimplementedError();
    }
  }
}
