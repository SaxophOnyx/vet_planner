part of 'add_medication_bloc.dart';

class AddMedicationEvent {
  const AddMedicationEvent();
}

class UpdateMedicationName extends AddMedicationEvent {
  final String name;

  const UpdateMedicationName(this.name);
}

class UpdateMedicationType extends AddMedicationEvent {
  final MedicationType type;

  const UpdateMedicationType(this.type);
}

class UpdateMedicationConcentration extends AddMedicationEvent {
  final int? concentration;

  const UpdateMedicationConcentration(this.concentration);
}

class SubmitInput extends AddMedicationEvent {
  const SubmitInput();
}
