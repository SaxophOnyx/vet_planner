class StoredMedication {
  final int id;
  final int medicationId;
  final int initialQuantity;
  final int freeQuantity;
  final int reservedQuantity;
  final DateTime expirationDate;
  final String? manualTitle;

  const StoredMedication({
    required this.id,
    required this.medicationId,
    required this.initialQuantity,
    required this.freeQuantity,
    required this.reservedQuantity,
    required this.expirationDate,
    this.manualTitle,
  });
}
