import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/splash_bloc.dart';
import 'splash_content.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      lazy: false,
      create: (_) => SplashBloc(
        appRouter: appDI.get<AppRouter>(),
      )..add(const StartLoading()),
      child: const SplashContent(),
    );
  }
}
