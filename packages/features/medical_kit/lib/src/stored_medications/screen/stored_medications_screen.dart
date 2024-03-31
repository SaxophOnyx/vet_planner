import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/stored_medications_bloc.dart';
import 'stored_medications_content.dart';

@RoutePage()
class StoredMedicationsScreen extends StatelessWidget {
  final MedicationType medicationType;

  const StoredMedicationsScreen({
    super.key,
    required this.medicationType,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StoredMedicationsBloc>(
      lazy: false,
      create: (_) => StoredMedicationsBloc(
        appRouter: appDI.get<AppRouter>(),
        getStoredMedicationsForMedicationTypeUseCase: appDI.get<GetStoredMedicationsForMedicationTypeUseCase>(),
        medicationType: medicationType,
      )..add(const Initialize()),
      child: const StoredMedicationsContent(),
    );
  }
}
