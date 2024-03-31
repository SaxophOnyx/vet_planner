import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'medication_entry.dart';

class MedicationList extends StatelessWidget {
  final List<MedicationType> medicationTypes;
  final void Function(int index) onViewStoredMedicationsPressed;

  const MedicationList({
    super.key,
    required this.medicationTypes,
    required this.onViewStoredMedicationsPressed,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    if (medicationTypes.isEmpty) {
      return Center(
        child: Text(
          'There is nothing here yet',
          style: AppFonts.inter16SemiBold.copyWith(
            color: colors.text,
          ),
        ),
      );
    }

    return ScrollConfiguration(
      behavior: const NoGlowScrollBehavior(),
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: medicationTypes.length,
        itemBuilder: (BuildContext context, int index) {
          return MedicationEntry(
            medicationType: medicationTypes[index],
            onViewStoredMedicationsPressed: () => onViewStoredMedicationsPressed(index),
          );
        },
      ),
    );
  }
}