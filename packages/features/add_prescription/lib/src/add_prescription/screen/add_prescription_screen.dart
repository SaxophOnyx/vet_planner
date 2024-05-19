import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/add_prescription_bloc.dart';
import 'add_prescription_content.dart';

@RoutePage()
class AddPrescriptionScreen extends StatelessWidget {
  const AddPrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddPrescriptionBloc>(
      create: (_) => AddPrescriptionBloc(
        appRouter: appDI.get<AppRouter>(),
        addPrescriptionUseCase: appDI.get<AddPrescriptionUseCase>(),
      ),
      child: const AddPrescriptionContent(),
    );
  }
}
