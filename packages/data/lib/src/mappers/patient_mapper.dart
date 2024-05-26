import 'package:domain/domain.dart';

import '../../data.dart';

abstract class PatientMapper {
  static Patient fromEntity(PatientEntity entity) {
    return Patient(
      id: entity.id,
      name: entity.name,
    );
  }
}
