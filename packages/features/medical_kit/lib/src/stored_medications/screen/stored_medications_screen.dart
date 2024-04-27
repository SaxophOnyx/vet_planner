import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/stored_medications_bloc.dart';
import 'stored_medications_content.dart';

@RoutePage()
class StoredMedicationsScreen extends StatelessWidget {
  final Medication medication;

  const StoredMedicationsScreen({
    super.key,
    required this.medication,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StoredMedicationsBloc>(
      lazy: false,
      create: (_) => StoredMedicationsBloc(
        appRouter: appDI.get<AppRouter>(),
        getStoredMedicationsForMedicationUseCase: appDI.get<GetStoredMedicationsUseCase>(),
        medication: medication,
      )..add(const Initialize()),
      child: const StoredMedicationsContent(),
    );
  }
}
