part of 'stored_medications_bloc.dart';

abstract class StoredMedicationsEvent {
  const StoredMedicationsEvent();
}

class Initialize extends StoredMedicationsEvent {
  const Initialize();
}

class AddStoredMedication extends StoredMedicationsEvent {
  const AddStoredMedication();
}
