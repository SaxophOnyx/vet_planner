import 'package:domain/domain.dart';

import '../../data.dart';

abstract class MedicationMapper {
  static Medication fromEntity(MedicationEntity entity) {
    return Medication(
      id: entity.id,
      name: entity.name,
      type: MedicationTypeMapper.fromEntity(entity.medicationTypeId),
      concentrationPerUnit: entity.concentrationPerUnit,
    );
  }
}
