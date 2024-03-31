import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/medical_kit_bloc.dart';
import 'medical_kit_content.dart';

@RoutePage()
class MedicalKitScreen extends StatelessWidget {
  const MedicalKitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MedicalKitBloc>(
      lazy: false,
      create: (_) => MedicalKitBloc(
        appRouter: appDI.get<AppRouter>(),
        getMedicationTypesUseCase: appDI.get<GetMedicationTypesUseCase>(),
      )..add(const Initialize()),
      child: const MedicalKitContent(),
    );
  }
}
