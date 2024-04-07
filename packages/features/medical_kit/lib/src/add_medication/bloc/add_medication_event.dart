part of 'add_medication_bloc.dart';

class AddMedicationEvent {
  const AddMedicationEvent();
}

class UpdateMedicationName extends AddMedicationEvent {
  final String name;

  const UpdateMedicationName(this.name);
}

class SubmitInput extends AddMedicationEvent {
  const SubmitInput();
}
