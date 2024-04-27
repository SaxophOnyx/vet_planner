import 'package:core_ui/core_ui.dart';
import 'package:navigation/navigation.dart';

part 'add_prescription_event.dart';
part 'add_prescription_state.dart';

class AddPrescriptionBloc extends Bloc<AddPrescriptionEvent, AddPrescriptionState> {
  final AppRouter _appRouter;

  AddPrescriptionBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(const AddPrescriptionState.initial()) {
    on<AddOneOffTake>(_onAddOneOffTake);
    on<AddPeriodicTake>(_onAddPeriodicTake);
    on<SubmitPrescription>(_onSubmitPrescription);
  }

  Future<void> _onAddOneOffTake(
    AddOneOffTake event,
    Emitter<AddPrescriptionState> emit,
  ) async {}

  Future<void> _onAddPeriodicTake(
    AddPeriodicTake event,
    Emitter<AddPrescriptionState> emit,
  ) async {}

  Future<void> _onSubmitPrescription(
    SubmitPrescription event,
    Emitter<AddPrescriptionState> emit,
  ) async {}
}
