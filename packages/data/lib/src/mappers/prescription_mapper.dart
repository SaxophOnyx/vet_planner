import 'package:domain/domain.dart';

import '../../data.dart';

abstract class PrescriptionMapper {
  static Prescription fromEntity(PrescriptionEntity entity) {
    return Prescription(
      id: entity.id,
      patientId: entity.patientId,
      comment: entity.comment,
    );
  }
}
