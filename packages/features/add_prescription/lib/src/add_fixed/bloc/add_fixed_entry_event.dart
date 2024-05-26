part of 'add_fixed_entry_bloc.dart';

abstract class AddFixedEntryEvent {
  const AddFixedEntryEvent();
}

class DayPressed extends AddFixedEntryEvent {
  final DateTime day;

  const DayPressed(this.day);
}

class UpdateDose extends AddFixedEntryEvent {
  final int dose;

  const UpdateDose(this.dose);
}

class UpdateTime extends AddFixedEntryEvent {
  final int hour;

  const UpdateTime(this.hour);
}

class UpdateMedicationName extends AddFixedEntryEvent {
  final String name;

  const UpdateMedicationName(this.name);
}

class SelectMedication extends AddFixedEntryEvent {
  final Medication medication;

  const SelectMedication(this.medication);
}

class SubmitEntry extends AddFixedEntryEvent {
  const SubmitEntry();
}
