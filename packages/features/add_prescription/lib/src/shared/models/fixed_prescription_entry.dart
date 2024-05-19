import 'package:domain/domain.dart';

import 'prescription_entry_type.dart';

class FixedPrescriptionEntry {
  final Medication medication;
  final List<DateTime> dates;
  final int dose;

  PrescriptionEntryType get type => PrescriptionEntryType.fixed;

  const FixedPrescriptionEntry({
    required this.medication,
    required this.dates,
    required this.dose,
  });
}
