part of 'medical_kit_bloc.dart';

class MedicalKitState {
  final Loading loading;
  final List<Medication> medications;

  bool get isLoading => loading == Loading.inProgress;

  const MedicalKitState.initial()
      : loading = Loading.inProgress,
        medications = const <Medication>[];

  const MedicalKitState({
    required this.loading,
    required this.medications,
  });

  MedicalKitState copyWith({
    Loading? loading,
    List<Medication>? medications,
  }) {
    return MedicalKitState(
      loading: loading ?? this.loading,
      medications: medications ?? this.medications,
    );
  }
}
