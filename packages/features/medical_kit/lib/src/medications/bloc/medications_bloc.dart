import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

import '../../../medical_kit.dart';
import '../models/medication_entry.dart';

part 'medications_events.dart';
part 'medications_state.dart';

class MedicationsBloc extends Bloc<MedicationsEvent, MedicationsState> {
  final AppRouter _appRouter;
  final GetMedicationsUseCase _getMedicationsUseCase;
  final GetStoredMedicationsUseCase _getStoredMedicationsUseCase;

  // TODO(SaxophOnyx): Implement observe
  MedicationsBloc({
    required AppRouter appRouter,
    required GetMedicationsUseCase getMedicationsUseCase,
    required GetStoredMedicationsUseCase getStoredMedicationsUseCase,
  })  : _appRouter = appRouter,
        _getMedicationsUseCase = getMedicationsUseCase,
        _getStoredMedicationsUseCase = getStoredMedicationsUseCase,
        super(const MedicationsState.initial()) {
    on<Initialize>(_onInitialize);
    on<AddMedication>(_onAddMedication);
    on<ManageStoredMedications>(_onManageStoredMedications);
    on<AddStoredMedication>(_onAddStoredMedication);
  }

  Future<void> _onInitialize(
    Initialize event,
    Emitter<MedicationsState> emit,
  ) async {
    try {
      final List<Medication> medications = await _getMedicationsUseCase.execute();

      final List<List<StoredMedication>> stored = await _getStoredMedicationsUseCase.execute(
        GetStoredMedicationsPayload(
          medicationIds: medications.map((Medication item) => item.id).toList(),
        ),
      );

      final List<MedicationEntry> models = medications.mapIndexed(
        (Medication item, int index) => MedicationEntry(
          medication: item,
          stored: stored[index],
        ),
      );

      emit(state.copyWith(
        medications: models,
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
    Emitter<MedicationsState> emit,
  ) async {
    final Medication? medication = await _appRouter.push(const AddMedicationRoute());
    if (medication != null) {
      final MedicationEntry model = MedicationEntry(
        medication: medication,
        stored: <StoredMedication>[],
      );

      final List<MedicationEntry> updatedMedications = <MedicationEntry>[
        ...state.medications,
        model,
      ];

      emit(state.copyWith(
        medications: updatedMedications,
      ));

      // TODO(SaxophOnyx): Implement success toast
    }
  }

  Future<void> _onManageStoredMedications(
    ManageStoredMedications event,
    Emitter<MedicationsState> emit,
  ) async {
    final Medication medication = state.medications[event.medicationIndex].medication;
    await _appRouter.push(StoredMedicationsRoute(medication: medication));
  }

  Future<void> _onAddStoredMedication(
    AddStoredMedication event,
    Emitter<MedicationsState> emit,
  ) async {
    final Medication medication = state.medications[event.medicationIndex].medication;
    final StoredMedication? stored = await _appRouter.push(AddStoredMedicationRoute(medication: medication));

    if (stored != null) {
      // TODO(SaxophOnyx): Update UI & show toast
    }
  }
}
