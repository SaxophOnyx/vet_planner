import '../../../domain.dart';

Map<int, List<PlainPrescriptionPlanEntry>> processPlan(PrescriptionPlan plan) {
  final Map<int, List<PlainPrescriptionPlanEntry>> result =
      <int, List<PlainPrescriptionPlanEntry>>{};

  for (final FixedPrescriptionPlan fixed in plan.fixedPlans) {
    final List<PlainPrescriptionPlanEntry> list =
        result[fixed.medicationId] ?? List<PlainPrescriptionPlanEntry>.empty(growable: true);

    list.addAll(fixed.dates.map(
      (DateTime date) => PlainPrescriptionPlanEntry(
        datetime: date,
        dose: fixed.dose,
      ),
    ));

    result[fixed.medicationId] = list;
  }

  for (final List<PlainPrescriptionPlanEntry> list in result.values) {
    list.sort(
      (PlainPrescriptionPlanEntry a, PlainPrescriptionPlanEntry b) =>
          a.datetime.compareTo(b.datetime),
    );
  }

  return result;
}
