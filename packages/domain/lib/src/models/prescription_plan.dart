class PrescriptionPlan {
  final int patientId;
  final String? comment;
  final List<FixedPrescriptionPlan> fixedPlans;

  const PrescriptionPlan({
    required this.patientId,
    this.comment,
    required this.fixedPlans,
  });
}

class FixedPrescriptionPlan {
  final int medicationId;
  final List<DateTime> dates;
  final int dose;

  const FixedPrescriptionPlan({
    required this.medicationId,
    required this.dates,
    required this.dose,
  });
}
