part of 'add_stored_medication_bloc.dart';

abstract class AddStoredMedicationEvent {
  const AddStoredMedicationEvent();
}

class UpdateExpirationDate extends AddStoredMedicationEvent {
  final String rawDate;

  const UpdateExpirationDate(this.rawDate);
}

class SubmitInput extends AddStoredMedicationEvent {
  const SubmitInput();
}
