import '../../../domain.dart';

Map<int, List<PrescriptionPlanEntry>> processPlan(PrescriptionPlan plan) {
  final Map<int, List<PrescriptionPlanEntry>> result = <int, List<PrescriptionPlanEntry>>{};

  for (final FixedPrescriptionPlan fixed in plan.fixedPlans) {
    final List<PrescriptionPlanEntry> list =
        result[fixed.medicationId] ?? List<PrescriptionPlanEntry>.empty(growable: true);

    list.addAll(fixed.dates.map(
      (DateTime date) => PrescriptionPlanEntry(
        date: date.millisecondsSinceEpoch,
        dose: fixed.dose,
      ),
    ));

    result[fixed.medicationId] = list;
  }

  for (final List<PrescriptionPlanEntry> list in result.values) {
    list.sort((PrescriptionPlanEntry a, PrescriptionPlanEntry b) => a.date.compareTo(b.date));
  }

  return result;
}
