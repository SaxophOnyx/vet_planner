import '../../domain.dart';

enum MedicationType {
  tablet(
    isDividable: true,
    measurementUnit: MeasurementUnit.piece,
  ),

  vial(
    isDividable: true,
    measurementUnit: MeasurementUnit.milliliter,
  ),

  ampoule(
    isDividable: false,
    measurementUnit: MeasurementUnit.milliliter,
  );

  final bool isDividable;
  final MeasurementUnit measurementUnit;

  const MedicationType({
    required this.isDividable,
    required this.measurementUnit,
  });
}
