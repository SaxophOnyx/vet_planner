part of 'medications_bloc.dart';

class MedicationsState {
  final Loading loading;
  final List<MedicationEntry> medications;

  bool get isLoading => loading == Loading.inProgress;

  const MedicationsState.initial()
      : loading = Loading.inProgress,
        medications = const <MedicationEntry>[];

  const MedicationsState({
    required this.loading,
    required this.medications,
  });

  MedicationsState copyWith({
    Loading? loading,
    List<MedicationEntry>? medications,
  }) {
    return MedicationsState(
      loading: loading ?? this.loading,
      medications: medications ?? this.medications,
    );
  }
}
