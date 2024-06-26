import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/add_stored_medication_bloc.dart';
import 'add_stored_medication_content.dart';

@RoutePage<StoredMedication>()
class AddStoredMedicationScreen extends StatelessWidget {
  final Medication medication;

  const AddStoredMedicationScreen({
    super.key,
    required this.medication,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddStoredMedicationBloc>(
      lazy: false,
      create: (_) => AddStoredMedicationBloc(
        appRouter: appDI.get<AppRouter>(),
        addStoredMedicationUseCase: appDI.get<AddStoredMedicationUseCase>(),
        medicationType: medication,
      ),
      child: const AddStoredMedicationContent(),
    );
  }
}
