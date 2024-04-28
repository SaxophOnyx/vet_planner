import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

extension LocalizationExtensions on BuildContext {
  Locale get currentLocale => this.locale;

  List<Locale> get locales => this.supportedLocales;

  List<LocalizationsDelegate<dynamic>> get localeDelegates => this.localizationDelegates;
}

extension TranslationExtensions on String {
  String translate({
    Map<String, String>? namedArgs,
  }) {
    return this.tr(
      namedArgs: namedArgs,
    );
  }

  String observeTranslation(
    BuildContext context, {
    Map<String, String>? namedArgs,
  }) {
    context.locale;
    return this.tr(
      namedArgs: namedArgs,
      context: context,
    );
  }
}
