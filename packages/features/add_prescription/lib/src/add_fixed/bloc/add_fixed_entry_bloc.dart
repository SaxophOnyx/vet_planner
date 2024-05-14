import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

import '../../shared/models/prescription_entry_dose.dart';

part 'add_fixed_entry_event.dart';
part 'add_fixed_entry_state.dart';

class AddFixedEntryBloc extends Bloc<AddFixedEntryEvent, AddFixedEntryState> {
  final AppRouter _appRouter;

  AddFixedEntryBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(const AddFixedEntryState.initial()) {
    on<DayPressed>(_onDayPressed);
    on<SubmitEntry>(_onSubmitEntry);
  }

  void _onDayPressed(
    DayPressed event,
    Emitter<AddFixedEntryState> emit,
  ) {
    final Set<DateTime> dates = state.dates.withRemovedOrAdded(event.day);
    emit(state.copyWith(
      dates: dates,
    ));
  }

  Future<void> _onSubmitEntry(
    SubmitEntry event,
    Emitter<AddFixedEntryState> emit,
  ) async {}
}
