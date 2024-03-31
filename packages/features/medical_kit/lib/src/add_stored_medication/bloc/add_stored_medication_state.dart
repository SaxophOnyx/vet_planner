part of 'add_stored_medication_bloc.dart';

class AddStoredMedicationState {
  final MedicationType medicationType;
  final DateTime? expirationDate;
  final String? expirationDateError;

  bool get hasError => expirationDateError != null;

  const AddStoredMedicationState.initial({
    required this.medicationType,
  })  : expirationDate = null,
        expirationDateError = null;

  const AddStoredMedicationState({
    required this.medicationType,
    required this.expirationDate,
    required this.expirationDateError,
  });

  AddStoredMedicationState copyWithExpirationDate({
    DateTime? expirationDate,
    String? expirationDateError,
  }) {
    return AddStoredMedicationState(
      medicationType: medicationType,
      expirationDate: expirationDate ?? this.expirationDate,
      expirationDateError: expirationDateError,
    );
  }
}
