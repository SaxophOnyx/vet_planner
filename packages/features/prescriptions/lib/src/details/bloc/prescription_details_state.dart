part of 'prescription_details_bloc.dart';

class PrescriptionDetailsState {
  final PrescriptionEntry entry;
  final Prescription prescription;
  final Patient patient;
  final Medication medication;
  final Loading loading;

  bool get isLoading => loading == Loading.inProgress;

  const PrescriptionDetailsState.initial({
    required this.entry,
  })  : loading = Loading.inProgress,
        prescription = const Prescription.empty(),
        patient = const Patient.empty(),
        medication = const Medication.empty();

  const PrescriptionDetailsState({
    required this.entry,
    required this.loading,
    required this.prescription,
    required this.patient,
    required this.medication,
  });

  PrescriptionDetailsState copyWith({
    PrescriptionEntry? entry,
    Loading? loading,
    Prescription? prescription,
    Patient? patient,
    Medication? medication,
  }) {
    return PrescriptionDetailsState(
      entry: entry ?? this.entry,
      loading: loading ?? this.loading,
      prescription: prescription ?? this.prescription,
      patient: patient ?? this.patient,
      medication: medication ?? this.medication,
    );
  }
}
