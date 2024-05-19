import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/settings_bloc.dart';
import '../mappers/locale_mapper.dart';

class SettingsContent extends StatelessWidget {
  const SettingsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.settings_title.observeTranslation(context),
        style: CustomAppBarStyle.secondary,
      ),
      backgroundColor: colors.background,
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (BuildContext context, SettingsState state) {
          if (state.isLoading) {
            return const Center(
              child: AppLoadingIndicator(),
            );
          }

          final SettingsBloc bloc = context.read<SettingsBloc>();

          return Padding(
            padding: const EdgeInsets.all(AppDimens.DEFAULT_PAGE_PADDING),
            child: Column(
              children: <Widget>[
                AppDropdownButton<Locale>(
                  text: LocaleKeys.settings_language.observeTranslation(context),
                  value: context.currentLocale,
                  onChanged: (Locale locale) async {
                    await context.setCurrentLocale(locale);
                  },
                  stringifier: (Locale item) => LocaleMapper.getLanguageLocaleKey(item).observeTranslation(context),
                  items: context.locales,
                ),
                const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
                AppToggle(
                  label: LocaleKeys.settings_prescriptionNotifications.observeTranslation(context),
                  value: state.receivePrescriptions,
                  onChanged: (bool value) => bloc.add(
                    UpdateNotificationSettings(
                      receivePrescriptions: value,
                    ),
                  ),
                ),
                const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
                AppToggle(
                  label: LocaleKeys.settings_medicationNotifications.observeTranslation(context),
                  value: state.receiveMedications,
                  onChanged: (bool value) => bloc.add(
                    UpdateNotificationSettings(
                      receiveMedications: value,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
