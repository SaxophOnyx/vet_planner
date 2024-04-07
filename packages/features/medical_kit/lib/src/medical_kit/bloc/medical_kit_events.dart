part of 'medical_kit_bloc.dart';

abstract class MedicalKitEvent {
  const MedicalKitEvent();
}

class Initialize extends MedicalKitEvent {
  const Initialize();
}

class AddMedication extends MedicalKitEvent {
  const AddMedication();
}

class ViewStoredMedications extends MedicalKitEvent {
  final int medicationIndex;

  const ViewStoredMedications(this.medicationIndex);
}
