import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

import '../../../medical_kit.dart';

part 'medical_kit_events.dart';
part 'medical_kit_state.dart';

class MedicalKitBloc extends Bloc<MedicalKitEvent, MedicalKitState> {
  final AppRouter _appRouter;
  final GetMedicationsUseCase _getMedicationsUseCase;

  MedicalKitBloc({
    required AppRouter appRouter,
    required GetMedicationsUseCase getMedicationsUseCase,
  })  : _appRouter = appRouter,
        _getMedicationsUseCase = getMedicationsUseCase,
        super(const MedicalKitState.initial()) {
    on<Initialize>(_onInitialize);
    on<AddMedication>(_onAddMedication);
    on<ViewStoredMedications>(_onViewStoredMedications);
  }

  Future<void> _onInitialize(
    Initialize event,
    Emitter<MedicalKitState> emit,
  ) async {
    try {
      final List<Medication> medications = await _getMedicationsUseCase.execute();

      emit(state.copyWith(
        medications: medications,
        loading: Loading.completed,
      ));
    } catch (_) {
      emit(state.copyWith(
        loading: Loading.failed,
      ));
    }
  }

  Future<void> _onAddMedication(
    AddMedication event,
    Emitter<MedicalKitState> emit,
  ) async {
    final Medication? medication = await _appRouter.push(const AddMedicationRoute());

    if (medication != null) {
      final List<Medication> updatedMedications = <Medication>[
        ...state.medications,
        medication,
      ];

      emit(state.copyWith(
        medications: updatedMedications,
      ));

      // TODO(SaxophOnyx): Implement success toast
    }
  }

  Future<void> _onViewStoredMedications(
    ViewStoredMedications event,
    Emitter<MedicalKitState> emit,
  ) async {
    final Medication medication = state.medications[event.medicationIndex];
    await _appRouter.push(StoredMedicationsRoute(medication: medication));
  }
}
