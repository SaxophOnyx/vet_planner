part of 'medical_kit_bloc.dart';

abstract class MedicalKitEvent {
  const MedicalKitEvent();
}

class AddMedicationType extends MedicalKitEvent {
  const AddMedicationType();
}
