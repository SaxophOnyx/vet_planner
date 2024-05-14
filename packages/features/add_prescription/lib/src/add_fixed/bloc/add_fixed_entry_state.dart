part of 'add_fixed_entry_bloc.dart';

class AddFixedEntryState {
  final Medication medication;
  final Set<DateTime> dates;
  final List<PrescriptionEntryDose> doses;

  const AddFixedEntryState.initial()
      : medication = const Medication.empty(),
        dates = const <DateTime>{},
        doses = const <PrescriptionEntryDose>[];

  const AddFixedEntryState({
    required this.medication,
    required this.dates,
    required this.doses,
  });

  AddFixedEntryState copyWith({
    Medication? medication,
    Set<DateTime>? dates,
    List<PrescriptionEntryDose>? doses,
  }) {
    return AddFixedEntryState(
      medication: medication ?? this.medication,
      dates: dates ?? this.dates,
      doses: doses ?? this.doses,
    );
  }
}
