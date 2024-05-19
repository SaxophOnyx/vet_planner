part of 'add_prescription_bloc.dart';

class AddPrescriptionState {
  final Patient patient;
  final String comment;
  final List<FixedPrescriptionEntry> fixedEntries;

  final String patientError;
  final String fixedEntriesError;

  bool get hasError => patientError.isNotEmpty || fixedEntriesError.isNotEmpty;

  const AddPrescriptionState.initial()
      : patient = const Patient.empty(),
        comment = '',
        fixedEntries = const <FixedPrescriptionEntry>[],
        patientError = '',
        fixedEntriesError = '';

  const AddPrescriptionState({
    required this.patient,
    required this.comment,
    required this.fixedEntries,
    required this.patientError,
    required this.fixedEntriesError,
  });

  AddPrescriptionState copyWith({
    Patient? patient,
    String? comment,
    List<FixedPrescriptionEntry>? fixedEntries,
    String? patientError,
    String? fixedEntriesError,
  }) {
    return AddPrescriptionState(
      patient: patient ?? this.patient,
      comment: comment ?? this.comment,
      fixedEntries: fixedEntries ?? this.fixedEntries,
      patientError: patientError ?? this.patientError,
      fixedEntriesError: fixedEntriesError ?? this.fixedEntriesError,
    );
  }
}
