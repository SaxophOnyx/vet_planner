import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/settings_bloc.dart';
import 'settings_content.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (_) => SettingsBloc(
        getNotificationSettingsUseCase: appDI.get<GetNotificationSettingsUseCase>(),
        updateNotificationSettingsUseCase: appDI.get<UpdateNotificationSettingsUseCase>(),
      )..add(const Initialize()),
      child: const SettingsContent(),
    );
  }
}
