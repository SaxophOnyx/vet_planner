import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'prescription_details_event.dart';
part 'prescription_details_state.dart';

class PrescriptionDetailsBloc extends Bloc<PrescriptionDetailsEvent, PrescriptionDetailsState> {
  final AppRouter _appRouter;
  final GetPrescriptionByIdUseCase _getPrescriptionByIdUseCase;
  final GetPatientByIdUseCase _getPatientByIdUseCase;

  PrescriptionDetailsBloc({
    required AppRouter appRouter,
    required GetPrescriptionByIdUseCase getPrescriptionByIdUseCase,
    required GetPatientByIdUseCase getPatientByIdUseCase,
  })  : _appRouter = appRouter,
        _getPrescriptionByIdUseCase = getPrescriptionByIdUseCase,
        _getPatientByIdUseCase = getPatientByIdUseCase,
        super(const PrescriptionDetailsState()) {
    on<LoadData>(_onLoadData);
  }

  Future<void> _onLoadData(
    LoadData event,
    Emitter<PrescriptionDetailsState> emit,
  ) async {
    // TODO(SaxophOnyx): Implement
  }
}
