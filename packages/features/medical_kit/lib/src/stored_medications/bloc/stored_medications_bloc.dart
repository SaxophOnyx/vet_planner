import 'package:core_ui/core_ui.dart';

part 'stored_medications_event.dart';
part 'stored_medications_state.dart';

class StoredMedicationsBloc extends Bloc<StoredMedicationsEvent, StoredMedicationsState> {
  StoredMedicationsBloc() : super(const StoredMedicationsState.initial());
}
