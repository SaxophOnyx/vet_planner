class ReservationPlanEntry {
  final int storedMedicationId;
  final DateTime datetime;
  final int dose;

  const ReservationPlanEntry({
    required this.storedMedicationId,
    required this.datetime,
    required this.dose,
  });
}
