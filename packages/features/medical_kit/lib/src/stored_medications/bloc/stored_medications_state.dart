part of 'stored_medications_bloc.dart';

class StoredMedicationsState {
  final Loading loading;
  final MedicationType medicationType;
  final List<StoredMedication> storedMedications;

  bool get isLoading => loading == Loading.inProgress;

  const StoredMedicationsState.initial({
    required this.medicationType,
  })  : loading = Loading.inProgress,
        storedMedications = const <StoredMedication>[];

  const StoredMedicationsState({
    required this.loading,
    required this.storedMedications,
    required this.medicationType,
  });

  StoredMedicationsState copyWith({
    Loading? loading,
    MedicationType? medicationType,
    List<StoredMedication>? storedMedications,
  }) {
    return StoredMedicationsState(
      loading: loading ?? this.loading,
      medicationType: medicationType ?? this.medicationType,
      storedMedications: storedMedications ?? this.storedMedications,
    );
  }
}
