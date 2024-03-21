import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/stored_medications_bloc.dart';
import 'stored_medications_content.dart';

@RoutePage()
class StoredMedicationsScreen extends StatelessWidget {
  const StoredMedicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StoredMedicationsBloc>(
      lazy: false,
      create: (_) => StoredMedicationsBloc(),
      child: const StoredMedicationsContent(),
    );
  }
}
