part of 'medical_kit_bloc.dart';

class MedicalKitState {
  final Loading loading;
  final List<MedicationType> medicationTypes;

  bool get isLoading => loading == Loading.inProgress;

  const MedicalKitState.initial()
      : loading = Loading.inProgress,
        medicationTypes = const <MedicationType>[];

  const MedicalKitState({
    required this.loading,
    required this.medicationTypes,
  });

  MedicalKitState copyWith({
    Loading? loading,
    List<MedicationType>? medicationTypes,
  }) {
    return MedicalKitState(
      loading: loading ?? this.loading,
      medicationTypes: medicationTypes ?? this.medicationTypes,
    );
  }
}
