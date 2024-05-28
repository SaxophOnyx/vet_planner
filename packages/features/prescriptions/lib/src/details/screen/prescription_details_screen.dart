import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/prescription_details_bloc.dart';
import 'prescription_details_content.dart';

@RoutePage()
class PrescriptionDetailsScreen extends StatelessWidget {
  final PrescriptionEntry entry;

  const PrescriptionDetailsScreen({
    super.key,
    required this.entry,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PrescriptionDetailsBloc>(
      create: (_) => PrescriptionDetailsBloc(
        appRouter: appDI.get<AppRouter>(),
        getPrescriptionByIdUseCase: appDI.get<GetPrescriptionByIdUseCase>(),
        getPatientByIdUseCase: appDI.get<GetPatientByIdUseCase>(),
        getStoredMedicationsUseCase: appDI.get<GetStoredMedicationByIdUseCase>(),
        getMedicationByIdUseCase: appDI.get<GetMedicationByIdUseCase>(),
        entry: entry,
      )..add(const LoadData()),
      child: const PrescriptionDetailsContent(),
    );
  }
}
