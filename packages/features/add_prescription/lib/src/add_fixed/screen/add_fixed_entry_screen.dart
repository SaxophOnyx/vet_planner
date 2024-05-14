import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../../shared/models/fixed_prescription_entry.dart';
import '../bloc/add_fixed_entry_bloc.dart';
import 'add_fixed_entry_content.dart';

@RoutePage<FixedPrescriptionEntry>()
class AddFixedEntryScreen extends StatelessWidget {
  const AddFixedEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddFixedEntryBloc>(
      create: (_) => AddFixedEntryBloc(
        appRouter: appDI.get<AppRouter>(),
      ),
      child: const AddFixedEntryContent(),
    );
  }
}
