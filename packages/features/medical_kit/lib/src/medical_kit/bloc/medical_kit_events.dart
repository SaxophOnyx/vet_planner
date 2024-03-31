part of 'medical_kit_bloc.dart';

abstract class MedicalKitEvent {
  const MedicalKitEvent();
}

class Initialize extends MedicalKitEvent {
  const Initialize();
}

class AddMedicationType extends MedicalKitEvent {
  const AddMedicationType();
}

class ViewStoredMedicationsForType extends MedicalKitEvent {
  final int medicationTypeIndex;

  const ViewStoredMedicationsForType(this.medicationTypeIndex);
}
