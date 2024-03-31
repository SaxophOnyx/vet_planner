import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

import '../../../medical_kit.dart';

part 'stored_medications_event.dart';
part 'stored_medications_state.dart';

class StoredMedicationsBloc extends Bloc<StoredMedicationsEvent, StoredMedicationsState> {
  final AppRouter _appRouter;
  final GetStoredMedicationsForMedicationTypeUseCase _getStoredMedicationsForMedicationTypeUseCase;

  StoredMedicationsBloc({
    required AppRouter appRouter,
    required GetStoredMedicationsForMedicationTypeUseCase getStoredMedicationsForMedicationTypeUseCase,
    required MedicationType medicationType,
  })  : _appRouter = appRouter,
        _getStoredMedicationsForMedicationTypeUseCase = getStoredMedicationsForMedicationTypeUseCase,
        super(StoredMedicationsState.initial(medicationType: medicationType)) {
    on<Initialize>(_onInitialize);
    on<AddStoredMedication>(_onAddStoredMedication);
  }

  Future<void> _onInitialize(
    Initialize event,
    Emitter<StoredMedicationsState> emit,
  ) async {
    try {
      final List<StoredMedication> storedMedications = await _getStoredMedicationsForMedicationTypeUseCase.execute(
        state.medicationType.id,
      );

      emit(state.copyWith(
        storedMedications: storedMedications,
        loading: Loading.completed,
      ));
    } catch (_) {
      emit(state.copyWith(
        loading: Loading.failed,
      ));
    }
  }

  Future<void> _onAddStoredMedication(
    AddStoredMedication event,
    Emitter<StoredMedicationsState> emit,
  ) async {
    final StoredMedication? medication = await _appRouter.push(AddStoredMedicationRoute(
      medicationType: state.medicationType,
    ));

    if (medication != null) {
      final List<StoredMedication> storedMedications = <StoredMedication>[
        ...state.storedMedications,
        medication,
      ];

      emit(state.copyWith(
        storedMedications: storedMedications,
      ));

      // TODO(SaxophOnyx): Show success toast
    }
  }
}
