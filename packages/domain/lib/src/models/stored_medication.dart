class StoredMedication {
  final int id;
  final int medicationId;
  final int initialQuantity;
  final int remainingQuantity;
  final int reservedQuantity;
  final DateTime expirationDate;

  const StoredMedication({
    required this.id,
    required this.medicationId,
    required this.initialQuantity,
    required this.remainingQuantity,
    required this.reservedQuantity,
    required this.expirationDate,
  });
}
