class Prescription {
  final int id;
  final int patientId;
  final String? comment;

  const Prescription({
    required this.id,
    required this.patientId,
    required this.comment,
  });
}
