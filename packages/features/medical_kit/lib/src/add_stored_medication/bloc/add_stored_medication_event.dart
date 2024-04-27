part of 'add_stored_medication_bloc.dart';

abstract class AddStoredMedicationEvent {
  const AddStoredMedicationEvent();
}

class UpdateExpirationDate extends AddStoredMedicationEvent {
  final String date;

  const UpdateExpirationDate(this.date);
}

class UpdateQuantity extends AddStoredMedicationEvent {
  final String quantity;

  const UpdateQuantity(this.quantity);
}

class SubmitInput extends AddStoredMedicationEvent {
  const SubmitInput();
}
