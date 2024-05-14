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
    required Medication medicationType,
    required AddStoredMedicationUseCase addStoredMedicationUseCase,
  })  : _appRouter = appRouter,
        _addStoredMedicationUseCase = addStoredMedicationUseCase,
        super(AddStoredMedicationState.initial(medication: medicationType)) {
    on<UpdateExpirationDate>(_onUpdateExpirationDate);
    on<UpdateQuantity>(_onUpdateQuantity);
    on<SubmitInput>(_onSubmitInput);
  }

  void _onUpdateExpirationDate(
    UpdateExpirationDate event,
    Emitter<AddStoredMedicationState> emit,
  ) {
    final DateTime? date = AppDateUtils.tryParseDate(event.date);

    emit(
      state.copyWithExpirationDate(
        expirationDate: date,
        expirationDateError: date == null ? LocaleKeys.common_validation_incorrectDate.translate() : null,
      ),
    );
  }

  void _onUpdateQuantity(
    UpdateQuantity event,
    Emitter<AddStoredMedicationState> emit,
  ) {
    emit(
      state.copyWithQuantity(
        quantity: int.tryParse(event.quantity),
        quantityError: null,
      ),
    );
  }

  Future<void> _onSubmitInput(
    SubmitInput event,
    Emitter<AddStoredMedicationState> emit,
  ) async {
    final DateTime? expirationDate = state.expirationDate;
    final String? expirationDateError = StoredMedicationValidator.validateExpirationDate(expirationDate);

    final int? quantity = state.quantity;
    final String? quantityError = quantity == null ? LocaleKeys.common_validation_notEmpty.translate() : null;

    emit(state.copyWithErrors(
      expirationDateError: expirationDateError,
      quantityError: quantityError,
    ));

    if (!state.hasErrors) {
      try {
        final StoredMedication medication = await _addStoredMedicationUseCase.execute(AddStoredMedicationPayload(
          medicationId: state.medication.id,
          expirationDate: expirationDate!,
          quantity: quantity!,
        ));

        await _appRouter.maybePop<StoredMedication>(medication);
      } catch (_) {
        // TODO(SaxophOnyx): Show error toast
      }
    }
  }
}
