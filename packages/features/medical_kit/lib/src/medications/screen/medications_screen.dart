import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/medications_bloc.dart';
import 'medications_content.dart';

@RoutePage()
class MedicationsScreen extends StatelessWidget {
  const MedicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MedicationsBloc>(
      lazy: false,
      create: (_) => MedicationsBloc(
        appRouter: appDI.get<AppRouter>(),
        getMedicationsUseCase: appDI.get<GetMedicationsUseCase>(),
        getStoredMedicationsUseCase: appDI.get<GetStoredMedicationsUseCase>(),
      )..add(const Initialize()),
      child: const MedicationsContent(),
    );
  }
}
