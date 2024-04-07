part of 'add_stored_medication_bloc.dart';

class AddStoredMedicationState {
  final Medication medication;
  final DateTime? expirationDate;
  final String? expirationDateError;

  bool get hasError => expirationDateError != null;

  const AddStoredMedicationState.initial({
    required this.medication,
  })  : expirationDate = null,
        expirationDateError = null;

  const AddStoredMedicationState({
    required this.medication,
    required this.expirationDate,
    required this.expirationDateError,
  });

  AddStoredMedicationState copyWithExpirationDate({
    DateTime? expirationDate,
    String? expirationDateError,
  }) {
    return AddStoredMedicationState(
      medication: medication,
      expirationDate: expirationDate ?? this.expirationDate,
      expirationDateError: expirationDateError,
    );
  }
}
