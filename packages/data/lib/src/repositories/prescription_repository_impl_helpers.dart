part of 'prescription_repository_impl.dart';

class _PrescriptionPlanEntry {
  final int date;
  final int dose;

  _PrescriptionPlanEntry({
    required this.date,
    required this.dose,
  });
}

Map<int, List<_PrescriptionPlanEntry>> _processPlan(PrescriptionPlan plan) {
  final Map<int, List<_PrescriptionPlanEntry>> result = <int, List<_PrescriptionPlanEntry>>{};

  for (final FixedPrescriptionPlan fixed in plan.fixedPlans) {
    final List<_PrescriptionPlanEntry> list =
        result[fixed.medicationId] ?? List<_PrescriptionPlanEntry>.empty(growable: true);

    list.addAll(fixed.dates.map(
      (DateTime date) => _PrescriptionPlanEntry(
        date: date.millisecondsSinceEpoch,
        dose: fixed.dose,
      ),
    ));

    result[fixed.medicationId] = list;
  }

  for (final List<_PrescriptionPlanEntry> list in result.values) {
    list.sort((_PrescriptionPlanEntry a, _PrescriptionPlanEntry b) => a.date.compareTo(b.date));
  }

  return result;
}
