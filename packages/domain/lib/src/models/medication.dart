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
}
