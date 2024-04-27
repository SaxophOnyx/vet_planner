import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../../../prescriptions.dart';

@RoutePage()
class PrescriptionsScreen extends StatelessWidget {
  const PrescriptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Prescriptions',
        style: CustomAppBarStyle.secondary,
      ),
      backgroundColor: colors.background,
      body: Center(
        child: AppFloatingButton(
          onPressed: () {
            final AppRouter appRouter = appDI.get<AppRouter>();
            appRouter.push(const AddPrescriptionRoute());
          },
        ),
      ),
    );
  }
}
