import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../../shared/models/prescription_entry_dose.dart';

class PrescriptionEntryDoseDisplay extends StatelessWidget {
  final PrescriptionEntryDose dose;

  const PrescriptionEntryDoseDisplay({
    super.key,
    required this.dose,
  });

  @override
  Widget build(BuildContext context) {
    return AppDropdownButton(
      text: 'text',
      value: MedicationType.ampoule,
      onChanged: (_) {},
      stringifier: (a) => a.name,
      items: MedicationType.values,
    );
  }
}
