part of 'add_medication_type_bloc.dart';

class AddMedicationTypeState {
  final String name;
  final String? nameError;

  bool get hasErrors => nameError != null;

  const AddMedicationTypeState.initial()
      : name = '',
        nameError = null;

  const AddMedicationTypeState({
    required this.name,
    required this.nameError,
  });

  AddMedicationTypeState copyWithName({
    String? name,
    String? nameError,
  }) {
    return AddMedicationTypeState(
      name: name ?? this.name,
      nameError: nameError,
    );
  }
}
