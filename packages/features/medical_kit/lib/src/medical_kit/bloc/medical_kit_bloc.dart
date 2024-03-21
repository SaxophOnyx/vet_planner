import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

import '../../../medical_kit.dart';

part 'medical_kit_events.dart';
part 'medical_kit_state.dart';

class MedicalKitBloc extends Bloc<MedicalKitEvent, MedicalKitState> {
  final AppRouter _appRouter;

  MedicalKitBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(const MedicalKitState.initial()) {
    on<AddMedicationType>(_onAddMedicationType);
  }

  Future<void> _onAddMedicationType(
    AddMedicationType event,
    Emitter<MedicalKitState> emit,
  ) async {
    final MedicationType? medicationType = await _appRouter.push(const AddMedicationTypeRoute());

    if (medicationType != null) {
      // TODO(SaxophOnyx): Implement success toast
      // TODO(SaxophOnyx): Update the list of medication types
    }
  }
}
