// ignore_for_file: prefer_const_constructors

import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/medical_kit_bloc.dart';
import '../widgets/medication_list.dart';

class MedicalKitContent extends StatelessWidget {
  const MedicalKitContent({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;
    final MedicalKitBloc bloc = context.read<MedicalKitBloc>();

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Placeholder',
        style: CustomAppBarStyle.secondary,
      ),
      backgroundColor: colors.background,
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.DEFAULT_PAGE_PADDING),
        child: BlocBuilder<MedicalKitBloc, MedicalKitState>(
          builder: (BuildContext context, MedicalKitState state) {
            // TODO(SaxophOnyx): Handle error state
            if (state.isLoading) {
              return Center(
                child: AppLoadingIndicator(),
              );
            }

            return MedicationList(
              medicationTypes: state.medicationTypes,
              onViewStoredMedicationsPressed: (int index) => bloc.add(ViewStoredMedicationsForType(index)),
            );
          },
        ),
      ),
      floatingActionButton: AppFloatingButton(
        onPressed: () => bloc.add(const AddMedicationType()),
      ),
    );
  }
}
