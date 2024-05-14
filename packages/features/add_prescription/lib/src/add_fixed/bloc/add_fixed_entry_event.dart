part of 'add_fixed_entry_bloc.dart';

abstract class AddFixedEntryEvent {
  const AddFixedEntryEvent();
}

class DayPressed extends AddFixedEntryEvent {
  final DateTime day;

  const DayPressed(this.day);
}

class SubmitEntry extends AddFixedEntryEvent {
  const SubmitEntry();
}
