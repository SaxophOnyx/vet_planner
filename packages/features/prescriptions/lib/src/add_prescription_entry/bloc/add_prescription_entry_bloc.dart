import 'package:core_ui/core_ui.dart';

part 'add_prescription_entry_event.dart';
part 'add_prescription_entry_state.dart';

class AddPrescriptionEntryBloc extends Bloc<AddPrescriptionEntryEvent, AddPrescriptionEntryState> {
  AddPrescriptionEntryBloc() : super(const AddPrescriptionEntryState.initial());
}
