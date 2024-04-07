import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/add_prescription_entry_bloc.dart';
import 'add_prescription_entry_content.dart';

@RoutePage()
class AddPrescriptionEntryScreen extends StatelessWidget {
  const AddPrescriptionEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddPrescriptionEntryBloc>(
      lazy: false,
      create: (_) => AddPrescriptionEntryBloc(),
      child: const AddPrescriptionEntryContent(),
    );
  }
}
