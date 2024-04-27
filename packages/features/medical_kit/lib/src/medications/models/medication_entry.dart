import 'package:domain/domain.dart';

class MedicationEntry {
  final Medication medication;
  final List<StoredMedication> stored;

  const MedicationEntry({
    required this.medication,
    required this.stored,
  });
}
