import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'add_medication_event.dart';
part 'add_medication_state.dart';

class AddMedicationBloc extends Bloc<AddMedicationEvent, AddMedicationState> {
  final AppRouter _appRouter;
  final AddMedicationUseCase _addMedicationUseCase;

  AddMedicationBloc({
    required AppRouter appRouter,
    required AddMedicationUseCase addMedicationUseCase,
  })  : _appRouter = appRouter,
        _addMedicationUseCase = addMedicationUseCase,
        super(const AddMedicationState.initial()) {
    on<UpdateMedicationName>(_onUpdateMedicationName);
    on<SubmitInput>(_onSubmitInput);
  }

  void _onUpdateMedicationName(
    UpdateMedicationName event,
    Emitter<AddMedicationState> emit,
  ) {
    emit(state.copyWithName(
      name: event.name,
      nameError: null,
    ));
  }

  Future<void> _onSubmitInput(
    SubmitInput event,
    Emitter<AddMedicationState> emit,
  ) async {
    final String name = state.name;
    final String? nameError = MedicationNameValidator.validateName(name);

    emit(state.copyWithName(
      name: name,
      nameError: nameError,
    ));

    if (!state.hasErrors) {
      try {
        final AddMedicationPayload payload = AddMedicationPayload(name: name);
        final Medication medicationType = await _addMedicationUseCase.execute(payload);
        await _appRouter.maybePop<Medication>(medicationType);
      } catch (_) {
        // TODO(SaxophOnyx): Implement error handling
      }
    }
  }
}
