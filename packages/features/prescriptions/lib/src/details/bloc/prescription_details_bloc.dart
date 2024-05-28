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
  final GetStoredMedicationByIdUseCase _getStoredMedicationsUseCase;
  final GetMedicationByIdUseCase _getMedicationByIdUseCase;

  PrescriptionDetailsBloc({
    required AppRouter appRouter,
    required GetPrescriptionByIdUseCase getPrescriptionByIdUseCase,
    required GetPatientByIdUseCase getPatientByIdUseCase,
    required GetStoredMedicationByIdUseCase getStoredMedicationsUseCase,
    required GetMedicationByIdUseCase getMedicationByIdUseCase,
    required PrescriptionEntry entry,
  })  : _appRouter = appRouter,
        _getPrescriptionByIdUseCase = getPrescriptionByIdUseCase,
        _getPatientByIdUseCase = getPatientByIdUseCase,
        _getStoredMedicationsUseCase = getStoredMedicationsUseCase,
        _getMedicationByIdUseCase = getMedicationByIdUseCase,
        super(PrescriptionDetailsState.initial(entry: entry)) {
    on<LoadData>(_onLoadData);
    on<Close>(_onClose);
  }

  Future<void> _onLoadData(
    LoadData event,
    Emitter<PrescriptionDetailsState> emit,
  ) async {
    final Prescription prescription = await _getPrescriptionByIdUseCase.execute(
      state.entry.prescriptionId,
    );

    final Patient patient = await _getPatientByIdUseCase.execute(prescription.patientId);
    final StoredMedication stored =
        await _getStoredMedicationsUseCase.execute(state.entry.storedMedicationId);
    final Medication medication = await _getMedicationByIdUseCase.execute(stored.medicationId);

    emit(
      state.copyWith(
        patient: patient,
        prescription: prescription,
        medication: medication,
        loading: Loading.completed,
      ),
    );
  }

  Future<void> _onClose(
    Close event,
    Emitter<PrescriptionDetailsState> emit,
  ) async {
    await _appRouter.maybePop();
  }
}
