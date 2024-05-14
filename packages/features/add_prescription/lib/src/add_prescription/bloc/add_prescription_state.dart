part of 'add_prescription_bloc.dart';

class AddPrescriptionState {
  final Patient patient;
  final String comment;
  final List<FixedPrescriptionEntry> fixedEntries;

  const AddPrescriptionState.initial()
      : patient = const Patient.empty(),
        comment = '',
        fixedEntries = const <FixedPrescriptionEntry>[];

  const AddPrescriptionState({
    required this.patient,
    required this.comment,
    required this.fixedEntries,
  });

  AddPrescriptionState copyWith({
    Patient? patient,
    String? comment,
    List<FixedPrescriptionEntry>? fixedEntries,
  }) {
    return AddPrescriptionState(
      patient: patient ?? this.patient,
      comment: comment ?? this.comment,
      fixedEntries: fixedEntries ?? this.fixedEntries,
    );
  }
}
