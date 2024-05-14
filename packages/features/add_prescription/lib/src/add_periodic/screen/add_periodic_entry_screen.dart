import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/add_periodic_entry_bloc.dart';
import 'add_periodic_entry_content.dart';

@RoutePage()
class AddPeriodicEntryScreen extends StatelessWidget {
  const AddPeriodicEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddPeriodicEntryBloc>(
      create: (_) => AddPeriodicEntryBloc(
        appRouter: appDI.get<AppRouter>(),
      ),
      child: const AddPeriodicEntryContent(),
    );
  }
}
