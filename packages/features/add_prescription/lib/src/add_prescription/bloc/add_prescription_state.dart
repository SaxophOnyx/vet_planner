part of 'add_prescription_bloc.dart';

class AddPrescriptionState {
  final Patient patient;
  final String comment;
  final List<FixedPrescriptionEntry> fixedEntries;

  final String patientError;
  final String fixedEntriesError;

  final String patientName;
  final List<Patient> patientSuggestions;
  final bool isLoadingPatientSuggestions;

  bool get hasError => patientError.isNotEmpty || fixedEntriesError.isNotEmpty;

  String get displayPatientName => patient.id != 0 ? patient.name : patientName;

  const AddPrescriptionState.initial()
      : patient = const Patient.empty(),
        comment = '',
        fixedEntries = const <FixedPrescriptionEntry>[],
        patientError = '',
        fixedEntriesError = '',
        patientName = '',
        patientSuggestions = const <Patient>[],
        isLoadingPatientSuggestions = false;

  const AddPrescriptionState({
    required this.patient,
    required this.comment,
    required this.fixedEntries,
    required this.patientError,
    required this.fixedEntriesError,
    required this.patientName,
    required this.patientSuggestions,
    required this.isLoadingPatientSuggestions,
  });

  AddPrescriptionState copyWith({
    Patient? patient,
    String? comment,
    List<FixedPrescriptionEntry>? fixedEntries,
    String? patientError,
    String? fixedEntriesError,
    String? patientName,
    List<Patient>? patientSuggestions,
    bool? isLoadingPatientSuggestions,
  }) {
    return AddPrescriptionState(
      patient: patient ?? this.patient,
      comment: comment ?? this.comment,
      fixedEntries: fixedEntries ?? this.fixedEntries,
      patientError: patientError ?? this.patientError,
      patientSuggestions: patientSuggestions ?? this.patientSuggestions,
      fixedEntriesError: fixedEntriesError ?? this.fixedEntriesError,
      patientName: patientName ?? this.patientName,
      isLoadingPatientSuggestions: isLoadingPatientSuggestions ?? this.isLoadingPatientSuggestions,
    );
  }
}
