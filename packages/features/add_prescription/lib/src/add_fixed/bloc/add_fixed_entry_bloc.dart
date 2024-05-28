import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

import '../../shared/models/fixed_prescription_entry.dart';

part 'add_fixed_entry_event.dart';
part 'add_fixed_entry_state.dart';

class AddFixedEntryBloc extends Bloc<AddFixedEntryEvent, AddFixedEntryState> {
  final AppRouter _appRouter;
  final FindMedicationsByNameUseCase _findMedicationsByNameUseCase;

  AddFixedEntryBloc({
    required AppRouter appRouter,
    required FindMedicationsByNameUseCase findMedicationsByNameUseCase,
  })  : _appRouter = appRouter,
        _findMedicationsByNameUseCase = findMedicationsByNameUseCase,
        super(const AddFixedEntryState.initial()) {
    on<DayPressed>(_onDayPressed);
    on<UpdateDose>(_onUpdateDose);
    on<UpdateTime>(_onUpdateTime);
    on<UpdateMedicationName>(_onUpdateMedicationName);
    on<SelectMedication>(_onSelectMedication);
    on<SubmitEntry>(_onSubmitEntry);
  }

  void _onDayPressed(
    DayPressed event,
    Emitter<AddFixedEntryState> emit,
  ) {
    final Set<DateTime> dates = state.dates.withRemovedOrAdded(event.day);

    emit(state.copyWith(
      dates: dates,
      datesError: '',
    ));
  }

  void _onUpdateDose(
    UpdateDose event,
    Emitter<AddFixedEntryState> emit,
  ) {
    emit(state.copyWith(
      dose: event.dose,
      doseError: '',
    ));
  }

  void _onUpdateTime(
    UpdateTime event,
    Emitter<AddFixedEntryState> emit,
  ) {
    emit(state.copyWith(
      hour: event.hour,
    ));
  }

  Future<void> _onUpdateMedicationName(
    UpdateMedicationName event,
    Emitter<AddFixedEntryState> emit,
  ) async {
    final String name = event.name;

    emit(state.copyWith(
      isLoadingMedications: true,
      medication: const Medication.empty(),
      medicationName: name,
    ));

    final List<Medication> medications = await _findMedicationsByNameUseCase.execute(
      FindMedicationsByNamePayload(
        name: name,
        limit: AppConstants.SEARCH_BAR_LIMIT,
      ),
    );

    emit(state.copyWith(
      suggestedMedications: medications,
      isLoadingMedications: false,
      medicationError: '',
    ));
  }

  void _onSelectMedication(
    SelectMedication event,
    Emitter<AddFixedEntryState> emit,
  ) {
    emit(state.copyWith(
      medication: event.medication,
      medicationName: event.medication.name,
      medicationError: '',
    ));
  }

  Future<void> _onSubmitEntry(
    SubmitEntry event,
    Emitter<AddFixedEntryState> emit,
  ) async {
    final String datesError = state.dates.isNotEmpty
        ? ''
        : LocaleKeys.addPrescription_addFixed_selectAtLeastOneDay.translate();
    final String medicationError = state.medication.id != 0
        ? ''
        : LocaleKeys.addPrescription_addFixed_selectMedication.translate();
    final String doseError =
        state.dose != 0 ? '' : LocaleKeys.addPrescription_addFixed_selectADose.translate();

    emit(state.copyWith(
      datesError: datesError,
      medicationError: medicationError,
      doseError: doseError,
    ));

    if (!state.hasError) {
      final List<DateTime> dates = state.dates
          .map(
            (DateTime item) => item.copyWith(hour: state.hour),
          )
          .toList();

      final FixedPrescriptionEntry entry = FixedPrescriptionEntry(
        dates: dates,
        dose: state.dose,
        medication: state.medication,
      );

      await _appRouter.maybePop<FixedPrescriptionEntry>(entry);
    }
  }
}
