import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:medical_kit/medical_kit.dart';
import 'package:medical_kit/medical_kit.gm.dart';
import 'package:navigation/navigation.dart';
import 'package:prescriptions/prescriptions.dart';
import 'package:settings/settings.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return AutoTabsRouter(
      routes: const <PageRouteInfo>[
        PrescriptionsRoute(),
        MedicationsRoute(),
        SettingsRoute(),
      ],
      builder: (BuildContext context, Widget child) {
        final TabsRouter tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          backgroundColor: colors.background,
          body: child,
          bottomNavigationBar: AppBottomNavBar(
            items: <AppBottomNavBarItem>[
              AppBottomNavBarItem(
                text: LocaleKeys.home_navbar_prescriptions.observeTranslation(context),
                icon: Icons.event,
              ),
              AppBottomNavBarItem(
                text: LocaleKeys.home_navbar_medKit.observeTranslation(context),
                icon: Icons.medical_services,
              ),
              AppBottomNavBarItem(
                text: LocaleKeys.home_navbar_settings.observeTranslation(context),
                icon: Icons.settings,
              ),
            ],
            index: tabsRouter.activeIndex,
            onItemChanged: tabsRouter.setActiveIndex,
          ),
        );
      },
    );
  }
}
