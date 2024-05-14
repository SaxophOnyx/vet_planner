import '../../domain.dart';

enum MedicationType {
  tablet(
    isDivisible: true,
    measurementUnit: MeasurementUnit.piece,
  ),

  vial(
    isDivisible: true,
    measurementUnit: MeasurementUnit.milliliter,
  ),

  ampoule(
    isDivisible: false,
    measurementUnit: MeasurementUnit.milliliter,
  );

  final bool isDivisible;
  final MeasurementUnit measurementUnit;

  const MedicationType({
    required this.isDivisible,
    required this.measurementUnit,
  });
}
