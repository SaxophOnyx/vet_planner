import 'package:domain/domain.dart';

abstract class MedicationTypeMapper {
  static MedicationType fromEntity(int id) {
    return MedicationType.values[id];
  }

  static int toEntity(MedicationType type) {
    return type.index;
  }
}
