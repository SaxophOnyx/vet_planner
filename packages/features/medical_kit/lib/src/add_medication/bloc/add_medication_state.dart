part of 'add_medication_bloc.dart';

class AddMedicationState {
  final String name;
  final String? nameError;

  bool get hasErrors => nameError != null;

  const AddMedicationState.initial()
      : name = '',
        nameError = null;

  const AddMedicationState({
    required this.name,
    required this.nameError,
  });

  AddMedicationState copyWithName({
    String? name,
    String? nameError,
  }) {
    return AddMedicationState(
      name: name ?? this.name,
      nameError: nameError,
    );
  }
}
