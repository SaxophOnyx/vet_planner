import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

import '../../../medical_kit.dart';

part 'stored_medications_event.dart';
part 'stored_medications_state.dart';

class StoredMedicationsBloc extends Bloc<StoredMedicationsEvent, StoredMedicationsState> {
  final AppRouter _appRouter;
  final GetStoredMedicationsForMedicationUseCase _getStoredMedicationsForMedicationUseCase;

  StoredMedicationsBloc({
    required AppRouter appRouter,
    required GetStoredMedicationsForMedicationUseCase getStoredMedicationsForMedicationUseCase,
    required Medication medication,
  })  : _appRouter = appRouter,
        _getStoredMedicationsForMedicationUseCase = getStoredMedicationsForMedicationUseCase,
        super(StoredMedicationsState.initial(medication: medication)) {
    on<Initialize>(_onInitialize);
    on<AddStoredMedication>(_onAddStoredMedication);
  }

  Future<void> _onInitialize(
    Initialize event,
    Emitter<StoredMedicationsState> emit,
  ) async {
    try {
      final List<StoredMedication> storedMedications = await _getStoredMedicationsForMedicationUseCase.execute(
        state.medication.id,
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
      medication: state.medication,
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
