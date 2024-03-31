import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'stored_medication_entry.dart';

class StoredMedicationList extends StatelessWidget {
  final List<StoredMedication> medications;

  const StoredMedicationList({
    super.key,
    required this.medications,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const NoGlowScrollBehavior(),
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: medications.length,
        itemBuilder: (BuildContext context, int index) {
          return StoredMedicationEntry(
            medication: medications[index],
          );
        },
      ),
    );
  }
}
