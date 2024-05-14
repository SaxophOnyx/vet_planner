import 'package:core_ui/core_ui.dart';
import 'package:navigation/navigation.dart';

part 'add_periodic_entry_event.dart';
part 'add_periodic_entry_state.dart';

class AddPeriodicEntryBloc extends Bloc<AddPeriodicEntryEvent, AddPeriodicEntryState> {
  final AppRouter _appRouter;

  AddPeriodicEntryBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(const AddPeriodicEntryState.initial());
}
