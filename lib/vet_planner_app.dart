import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class VetPlannerApp extends StatelessWidget {
  const VetPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = appDI.get<AppRouter>();

    return LocalizationWrapper(
      builder: (BuildContext context) {
        return MaterialApp.router(
          routerConfig: appRouter.config(),
          locale: context.currentLocale,
          supportedLocales: context.locales,
          localizationsDelegates: context.localeDelegates,
          theme: ThemeData.light().copyWith(
            extensions: <ThemeExtension<AppColors>>[
              const DefaultColors(),
            ],
          ),
        );
      },
    );
  }
}
