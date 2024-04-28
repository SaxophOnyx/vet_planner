import 'package:domain/domain.dart';

import '../../data.dart';

abstract class StoredMedicationMapper {
  static StoredMedication fromEntity(StoredMedicationEntity entity) {
    return StoredMedication(
      id: entity.id,
      medicationId: entity.medicationId,
      initialQuantity: entity.initialQuantity,
      freeQuantity: entity.freeQuantity,
      reservedQuantity: entity.reservedQuantity,
      expirationDate: DateTimeMapper.fromEntity(entity.expirationDateMsSinceEpoch),
      manualTitle: entity.manualTitle,
    );
  }
}
