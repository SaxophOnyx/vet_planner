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
    on<UpdateMedicationType>(_onUpdateMedicationType);
    on<UpdateMedicationConcentration>(_onUpdateMedicationConcentration);
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

  void _onUpdateMedicationType(
    UpdateMedicationType event,
    Emitter<AddMedicationState> emit,
  ) {
    emit(
      state.copyWithType(
        type: event.type,
      ),
    );
  }

  void _onUpdateMedicationConcentration(
    UpdateMedicationConcentration event,
    Emitter<AddMedicationState> emit,
  ) {
    emit(
      state.copyWithConcentration(
        concentration: event.concentration,
        concentrationError: null,
      ),
    );
  }

  Future<void> _onSubmitInput(
    SubmitInput event,
    Emitter<AddMedicationState> emit,
  ) async {
    final String name = state.name;
    final String? nameError = MedicationNameValidator.validateName(name);

    final MedicationType type = state.type;

    final int? concentration = state.concentration;
    final String? concentrationError = concentration == null ? LocaleKeys.common_validation_notEmpty.translate() : null;

    emit(state.copyWithErrors(
      nameError: nameError,
      concentrationError: concentrationError,
    ));

    if (!state.hasErrors) {
      try {
        final AddMedicationPayload payload = AddMedicationPayload(
          type: type,
          name: name,
          concentrationPerUnit: concentration!,
        );

        final Medication medicationType = await _addMedicationUseCase.execute(payload);
        await _appRouter.maybePop<Medication>(medicationType);
      } catch (_) {
        // TODO(SaxophOnyx): Implement error handling
      }
    }
  }
}
