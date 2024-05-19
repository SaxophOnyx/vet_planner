part of 'add_fixed_entry_bloc.dart';

class AddFixedEntryState {
  final Medication medication;
  final Set<DateTime> dates;
  final int dose;
  final int hour;

  final String medicationError;
  final String datesError;
  final String doseError;

  bool get hasError => medicationError.isNotEmpty || datesError.isNotEmpty || doseError.isNotEmpty;

  const AddFixedEntryState.initial()
      : medication = const Medication.empty(),
        dates = const <DateTime>{},
        dose = 0,
        hour = 0,
        medicationError = '',
        datesError = '', doseError = '';

  const AddFixedEntryState({
    required this.medication,
    required this.dates,
    required this.dose,
    required this.hour,
    required this.medicationError,
    required this.datesError,
    required this.doseError,
  });

  AddFixedEntryState copyWith({
    Medication? medication,
    Set<DateTime>? dates,
    int? dose,
    int? hour,
    String? medicationError,
    String? datesError,
    String? doseError,
  }) {
    return AddFixedEntryState(
      medication: medication ?? this.medication,
      dates: dates ?? this.dates,
      dose: dose ?? this.dose,
      hour: hour ?? this.hour,
      medicationError: medicationError ?? this.medicationError,
      datesError: datesError ?? this.datesError,
      doseError: doseError ?? this.doseError,
    );
  }
}
