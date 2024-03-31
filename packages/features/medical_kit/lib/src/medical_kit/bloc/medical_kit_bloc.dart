import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

import '../../../medical_kit.dart';

part 'medical_kit_events.dart';
part 'medical_kit_state.dart';

class MedicalKitBloc extends Bloc<MedicalKitEvent, MedicalKitState> {
  final AppRouter _appRouter;
  final GetMedicationTypesUseCase _getMedicationTypesUseCase;

  MedicalKitBloc({
    required AppRouter appRouter,
    required GetMedicationTypesUseCase getMedicationTypesUseCase,
  })  : _appRouter = appRouter,
        _getMedicationTypesUseCase = getMedicationTypesUseCase,
        super(const MedicalKitState.initial()) {
    on<Initialize>(_onInitialize);
    on<AddMedicationType>(_onAddMedicationType);
    on<ViewStoredMedicationsForType>(_onViewStoredMedicationsForType);
  }

  Future<void> _onInitialize(
    Initialize event,
    Emitter<MedicalKitState> emit,
  ) async {
    try {
      final List<MedicationType> medicationTypes = await _getMedicationTypesUseCase.execute();

      emit(state.copyWith(
        medicationTypes: medicationTypes,
        loading: Loading.completed,
      ));
    } catch (_) {
      emit(state.copyWith(
        loading: Loading.failed,
      ));
    }
  }

  Future<void> _onAddMedicationType(
    AddMedicationType event,
    Emitter<MedicalKitState> emit,
  ) async {
    final MedicationType? medicationType = await _appRouter.push(const AddMedicationTypeRoute());

    if (medicationType != null) {
      final List<MedicationType> updatedMedicationTypes = <MedicationType>[
        ...state.medicationTypes,
        medicationType,
      ];

      emit(state.copyWith(
        medicationTypes: updatedMedicationTypes,
      ));

      // TODO(SaxophOnyx): Implement success toast
    }
  }

  Future<void> _onViewStoredMedicationsForType(
    ViewStoredMedicationsForType event,
    Emitter<MedicalKitState> emit,
  ) async {
    final MedicationType medicationType = state.medicationTypes[event.medicationTypeIndex];
    await _appRouter.push(StoredMedicationsRoute(medicationType: medicationType));
  }
}
