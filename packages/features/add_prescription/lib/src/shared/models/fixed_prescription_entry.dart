import 'package:domain/domain.dart';

import 'prescription_entry_dose.dart';
import 'prescription_entry_type.dart';

class FixedPrescriptionEntry {
  final Medication medication;
  final List<DateTime> dates;
  final PrescriptionEntryType type;
  final List<PrescriptionEntryDose> doses;

  const FixedPrescriptionEntry({
    required this.medication,
    required this.dates,
    required this.doses,
  }) : type = PrescriptionEntryType.fixed;
}
