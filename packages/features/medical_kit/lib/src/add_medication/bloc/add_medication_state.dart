part of 'add_medication_bloc.dart';

class AddMedicationState {
  final String name;
  final String? nameError;

  final MedicationType type;

  final int? concentration;
  final String? concentrationError;

  bool get hasErrors => !compareAllTo(<String?>[
        nameError,
        concentrationError,
      ], null);

  const AddMedicationState.initial()
      : name = '',
        nameError = null,
        type = MedicationType.ampoule,
        concentration = null,
        concentrationError = null;

  const AddMedicationState({
    required this.name,
    required this.nameError,
    required this.type,
    required this.concentration,
    required this.concentrationError,
  });

  AddMedicationState copyWithName({
    required String name,
    required String? nameError,
  }) {
    return AddMedicationState(
      name: name,
      nameError: nameError,
      type: type,
      concentration: concentration,
      concentrationError: concentrationError,
    );
  }

  AddMedicationState copyWithType({
    MedicationType? type,
  }) {
    return AddMedicationState(
      name: name,
      nameError: nameError,
      type: type ?? this.type,
      concentration: concentration,
      concentrationError: concentrationError,
    );
  }

  AddMedicationState copyWithConcentration({
    required int? concentration,
    required String? concentrationError,
  }) {
    return AddMedicationState(
      name: name,
      nameError: nameError,
      type: type,
      concentration: concentration,
      concentrationError: concentrationError,
    );
  }

  AddMedicationState copyWithErrors({
    required String? concentrationError,
    required String? nameError,
  }) {
    return AddMedicationState(
      name: name,
      nameError: nameError,
      type: type,
      concentration: concentration,
      concentrationError: concentrationError,
    );
  }
}
