import 'dart:async';

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
  final ObserveStoredMedicationCreatedUseCase _observeStoredMedicationCreatedUseCase;

  late final StreamSubscription<StoredMedication> _storedMedicationSubscription;

  MedicationsBloc({
    required AppRouter appRouter,
    required GetMedicationsUseCase getMedicationsUseCase,
    required GetStoredMedicationsUseCase getStoredMedicationsUseCase,
    required ObserveStoredMedicationCreatedUseCase observeStoredMedicationCreatedUseCase,
  })  : _appRouter = appRouter,
        _getMedicationsUseCase = getMedicationsUseCase,
        _getStoredMedicationsUseCase = getStoredMedicationsUseCase,
        _observeStoredMedicationCreatedUseCase = observeStoredMedicationCreatedUseCase,
        super(const MedicationsState.initial()) {
    on<Initialize>(_onInitialize);
    on<AddMedication>(_onAddMedication);
    on<ManageStoredMedications>(_onManageStoredMedications);
    on<AddStoredMedication>(_onAddStoredMedication);
    on<StoredMedicationAdded>(_onStoredMedicationAdded);
  }

  Future<void> _onInitialize(
    Initialize event,
    Emitter<MedicationsState> emit,
  ) async {
    _storedMedicationSubscription = _observeStoredMedicationCreatedUseCase.execute().listen(
      (StoredMedication event) {
        add(StoredMedicationAdded(event));
      },
    );

    try {
      final List<Medication> medications = await _getMedicationsUseCase.execute();

      final List<List<StoredMedication>> stored = await _getStoredMedicationsUseCase.execute(
        GetStoredMedicationsPayload(
          medicationIds: medications.map((Medication item) => item.id).toList(),
        ),
      );

      final List<MedicationEntry> models = medications.customMapIndexed(
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
    await _appRouter.push(AddStoredMedicationRoute(medication: medication));
  }

  void _onStoredMedicationAdded(
    StoredMedicationAdded event,
    Emitter<MedicationsState> emit,
  ) {
    final StoredMedication stored = event.storedMedication;

    final int index = state.medications.indexWhere(
      (MedicationEntry entry) => entry.medication.id == stored.medicationId,
    );

    if (index != -1) {
      final MedicationEntry entry = state.medications[index];

      final MedicationEntry updatedEntry = MedicationEntry(
        medication: entry.medication,
        stored: <StoredMedication>[
          ...entry.stored,
          stored,
        ],
      );

      final List<MedicationEntry> updatedMedications = List<MedicationEntry>.from(state.medications);
      updatedMedications[index] = updatedEntry;

      emit(state.copyWith(
        medications: updatedMedications,
      ));
    }
  }

  @override
  Future<void> close() async {
    await _storedMedicationSubscription.cancel();
    super.close();
  }
}
