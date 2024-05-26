import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

import '../../shared/models/fixed_prescription_entry.dart';

part 'add_fixed_entry_event.dart';
part 'add_fixed_entry_state.dart';

class AddFixedEntryBloc extends Bloc<AddFixedEntryEvent, AddFixedEntryState> {
  final AppRouter _appRouter;

  AddFixedEntryBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(const AddFixedEntryState.initial()) {
    on<DayPressed>(_onDayPressed);
    on<UpdateDose>(_onUpdateDose);
    on<UpdateTime>(_onUpdateTime);
    on<UpdateMedicationName>(_onUpdateMedicationName);
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

  void _onUpdateMedicationName(
    UpdateMedicationName event,
    Emitter<AddFixedEntryState> emit,
  ) {
    // TODO(SaxophOnyx): Implement search
    final Medication medication = Medication(
      id: 1,
      name: event.name,
      type: MedicationType.ampoule,
      concentrationPerUnit: 0,
    );

    emit(state.copyWith(
      medication: medication,
      medicationError: '',
    ));
  }

  Future<void> _onSubmitEntry(
    SubmitEntry event,
    Emitter<AddFixedEntryState> emit,
  ) async {
    final String datesError = state.dates.isNotEmpty ? '' : 'Select at least one day';
    final String medicationError = state.medication.id != 0 ? '' : 'Select a medication';
    final String doseError = state.dose != 0 ? '' : 'Select a dose';

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
