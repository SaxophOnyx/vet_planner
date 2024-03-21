part of 'add_medication_type_bloc.dart';

class AddMedicationTypeEvent {
  const AddMedicationTypeEvent();
}

class UpdateMedicationTypeName extends AddMedicationTypeEvent {
  final String name;

  const UpdateMedicationTypeName(this.name);
}

class SubmitInput extends AddMedicationTypeEvent {
  const SubmitInput();
}
