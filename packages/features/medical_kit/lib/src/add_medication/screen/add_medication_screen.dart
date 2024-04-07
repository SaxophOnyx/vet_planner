import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/add_medication_bloc.dart';
import 'add_medication_content.dart';

@RoutePage<Medication>()
class AddMedicationScreen extends StatelessWidget {
  const AddMedicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddMedicationBloc>(
      lazy: false,
      create: (_) => AddMedicationBloc(
        appRouter: appDI.get<AppRouter>(),
        addMedicationUseCase: appDI.get<AddMedicationUseCase>(),
      ),
      child: const AddMedicationContent(),
    );
  }
}
