// ignore_for_file: prefer_const_constructors

import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:medical_kit/medical_kit.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return AutoTabsRouter(
      routes: const <PageRouteInfo>[
        MedicalKitRoute(),
      ],
      builder: (BuildContext context, Widget child) {
        final TabsRouter tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          backgroundColor: colors.background,
          body: child,
          bottomNavigationBar: AppBottomNavBar(),
        );
      },
    );
  }
}
