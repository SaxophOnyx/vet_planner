part of 'medications_bloc.dart';

abstract class MedicationsEvent {
  const MedicationsEvent();
}

class Initialize extends MedicationsEvent {
  const Initialize();
}

class AddMedication extends MedicationsEvent {
  const AddMedication();
}

class ManageStoredMedications extends MedicationsEvent {
  final int medicationIndex;

  const ManageStoredMedications(this.medicationIndex);
}

class AddStoredMedication extends MedicationsEvent {
  final int medicationIndex;

  const AddStoredMedication(this.medicationIndex);
}

class StoredMedicationAdded extends MedicationsEvent {
  final StoredMedication storedMedication;

  const StoredMedicationAdded(this.storedMedication);
}
