part of 'add_stored_medication_bloc.dart';

class AddStoredMedicationState {
  final Medication medication;
  final DateTime? expirationDate;
  final String? expirationDateError;
  final int? quantity;
  final String? quantityError;

  bool get hasErrors => !compareAllTo(<String?>[
        expirationDateError,
        quantityError,
      ], null);

  const AddStoredMedicationState.initial({
    required this.medication,
  })  : expirationDate = null,
        expirationDateError = null,
        quantity = null,
        quantityError = null;

  const AddStoredMedicationState({
    required this.medication,
    required this.expirationDate,
    required this.expirationDateError,
    required this.quantity,
    required this.quantityError,
  });

  AddStoredMedicationState copyWithExpirationDate({
    required DateTime? expirationDate,
    required String? expirationDateError,
  }) {
    return AddStoredMedicationState(
      medication: medication,
      expirationDate: expirationDate,
      expirationDateError: expirationDateError,
      quantity: quantity,
      quantityError: quantityError,
    );
  }

  AddStoredMedicationState copyWithQuantity({
    required int? quantity,
    required String? quantityError,
  }) {
    return AddStoredMedicationState(
      medication: medication,
      expirationDate: expirationDate,
      expirationDateError: expirationDateError,
      quantity: quantity,
      quantityError: quantityError,
    );
  }

  AddStoredMedicationState copyWithErrors({
    required String? expirationDateError,
    required String? quantityError,
  }) {
    return AddStoredMedicationState(
      medication: medication,
      expirationDate: expirationDate,
      expirationDateError: expirationDateError,
      quantity: quantity,
      quantityError: quantityError,
    );
  }
}
