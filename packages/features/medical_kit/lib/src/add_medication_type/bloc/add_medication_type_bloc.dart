import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'add_medication_type_event.dart';
part 'add_medication_type_state.dart';

class AddMedicationTypeBloc extends Bloc<AddMedicationTypeEvent, AddMedicationTypeState> {
  final AppRouter _appRouter;
  final AddMedicationTypeUseCase _addMedicationTypeUseCase;

  AddMedicationTypeBloc({
    required AppRouter appRouter,
    required AddMedicationTypeUseCase addMedicationTypeUseCase,
  })  : _appRouter = appRouter,
        _addMedicationTypeUseCase = addMedicationTypeUseCase,
        super(const AddMedicationTypeState.initial()) {
    on<UpdateMedicationTypeName>(_onUpdateMedicationTypeName);
    on<SubmitInput>(_onSubmitInput);
  }

  void _onUpdateMedicationTypeName(
    UpdateMedicationTypeName event,
    Emitter<AddMedicationTypeState> emit,
  ) {
    emit(state.copyWithName(name: event.name, nameError: null));
  }

  Future<void> _onSubmitInput(
    SubmitInput event,
    Emitter<AddMedicationTypeState> emit,
  ) async {
    final String name = state.name;
    final String? nameError = MedicationTypeNameValidator.validate(name);

    emit(state.copyWithName(
      name: name,
      nameError: nameError,
    ));

    if (!state.hasErrors) {
      try {
        final AddMedicationTypePayload payload = AddMedicationTypePayload(name: name);
        final MedicationType medicationType = await _addMedicationTypeUseCase.execute(payload);
        await _appRouter.maybePop<MedicationType>(medicationType);
      } catch (_) {
        // TODO(SaxophOnyx): Implement error handling
      }
    }
  }
}
