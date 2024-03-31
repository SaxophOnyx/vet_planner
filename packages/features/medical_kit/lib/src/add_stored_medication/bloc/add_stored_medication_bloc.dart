import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'add_stored_medication_event.dart';
part 'add_stored_medication_state.dart';

class AddStoredMedicationBloc extends Bloc<AddStoredMedicationEvent, AddStoredMedicationState> {
  final AppRouter _appRouter;
  final AddStoredMedicationUseCase _addStoredMedicationUseCase;

  AddStoredMedicationBloc({
    required AppRouter appRouter,
    required MedicationType medicationType,
    required AddStoredMedicationUseCase addStoredMedicationUseCase,
  })  : _appRouter = appRouter,
        _addStoredMedicationUseCase = addStoredMedicationUseCase,
        super(AddStoredMedicationState.initial(medicationType: medicationType)) {
    on<UpdateExpirationDate>(_onUpdateExpirationDate);
    on<SubmitInput>(_onSubmitInput);
  }

  void _onUpdateExpirationDate(
    UpdateExpirationDate event,
    Emitter<AddStoredMedicationState> emit,
  ) {}

  Future<void> _onSubmitInput(
    SubmitInput event,
    Emitter<AddStoredMedicationState> emit,
  ) async {
    final DateTime? expirationDate = state.expirationDate;
    final String? expirationDateError = StoredMedicationValidator.validateExpirationDate(expirationDate);

    emit(AddStoredMedicationState(
      medicationType: state.medicationType,
      expirationDate: expirationDate,
      expirationDateError: expirationDateError,
    ));

    if (!state.hasError) {
      try {
        final StoredMedication medication = await _addStoredMedicationUseCase.execute(AddStoredMedicationPayload(
          medicationTypeId: state.medicationType.id,
          expirationDate: expirationDate!,
        ));

        await _appRouter.maybePop<StoredMedication>(medication);
      } catch (_) {
        // TODO(SaxophOnyx): Show error toast
      }
    }
  }
}
