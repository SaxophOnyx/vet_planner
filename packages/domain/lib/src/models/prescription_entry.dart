class PrescriptionEntry {
  final int id;
  final int prescriptionId;
  final int storedMedicationId;
  final int dosage;
  final DateTime datetime;

  const PrescriptionEntry({
    required this.id,
    required this.prescriptionId,
    required this.storedMedicationId,
    required this.dosage,
    required this.datetime,
  });
}
