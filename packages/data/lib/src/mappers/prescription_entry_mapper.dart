import 'package:domain/domain.dart';

import '../../data.dart';

abstract class PrescriptionEntryMapper {
  static PrescriptionEntry fromEntity(PrescriptionEntryEntity entity) {
    return PrescriptionEntry(
      id: entity.id,
      prescriptionId: entity.prescriptionId,
      storedMedicationId: entity.storedMedicationId,
      dosage: entity.dosage,
      datetime: DateTimeMapper.fromEntity(entity.datetimeMsSinceEpoch),
    );
  }
}
