import '../../domain.dart';

class Medication {
  final int id;
  final String name;
  final MedicationType type;
  final int concentrationPerUnit;

  const Medication({
    required this.id,
    required this.name,
    required this.type,
    required this.concentrationPerUnit,
  });

  const Medication.empty()
      : id = 0,
        name = '',
        type = MedicationType.ampoule,
        concentrationPerUnit = 0;
}
