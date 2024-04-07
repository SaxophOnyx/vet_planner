part of 'stored_medications_bloc.dart';

class StoredMedicationsState {
  final Loading loading;
  final Medication medication;
  final List<StoredMedication> storedMedications;

  bool get isLoading => loading == Loading.inProgress;

  const StoredMedicationsState.initial({
    required this.medication,
  })  : loading = Loading.inProgress,
        storedMedications = const <StoredMedication>[];

  const StoredMedicationsState({
    required this.loading,
    required this.storedMedications,
    required this.medication,
  });

  StoredMedicationsState copyWith({
    Loading? loading,
    Medication? medication,
    List<StoredMedication>? storedMedications,
  }) {
    return StoredMedicationsState(
      loading: loading ?? this.loading,
      medication: medication ?? this.medication,
      storedMedications: storedMedications ?? this.storedMedications,
    );
  }
}
