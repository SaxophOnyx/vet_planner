import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/add_medication_type_bloc.dart';
import 'add_medication_type_content.dart';

@RoutePage<MedicationType>()
class AddMedicationTypeScreen extends StatelessWidget {
  const AddMedicationTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddMedicationTypeBloc>(
      lazy: false,
      create: (_) => AddMedicationTypeBloc(
        appRouter: appDI.get<AppRouter>(),
        addMedicationTypeUseCase: appDI.get<AddMedicationTypeUseCase>(),
      ),
      child: const AddMedicationTypeContent(),
    );
  }
}
