import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class VetPlannerApp extends StatelessWidget {
  const VetPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = appDI.get<AppRouter>();

    return MaterialApp.router(
      routerConfig: appRouter.config(),
    );
  }
}
