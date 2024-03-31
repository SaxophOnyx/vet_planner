class StoredMedication {
  final int id;
  final int medicationTypeId;
  final DateTime expirationDate;

  const StoredMedication({
    required this.id,
    required this.medicationTypeId,
    required this.expirationDate,
  });
}
