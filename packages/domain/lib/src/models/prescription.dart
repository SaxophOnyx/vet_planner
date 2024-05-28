class Prescription {
  final int id;
  final int patientId;
  final String? comment;

  const Prescription({
    required this.id,
    required this.patientId,
    required this.comment,
  });

  const Prescription.empty()
      : id = 0,
        patientId = 0,
        comment = null;
}
