import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

import '../../../add_prescription.dart';
import '../../shared/models/fixed_prescription_entry.dart';
import '../../shared/models/prescription_entry_type.dart';

part 'add_prescription_event.dart';
part 'add_prescription_state.dart';

class AddPrescriptionBloc extends Bloc<AddPrescriptionEvent, AddPrescriptionState> {
  final AppRouter _appRouter;
  final AddPrescriptionUseCase _addPrescriptionUseCase;
  final FindPatientsByNameUseCase _findPatientsByNameUseCase;

  AddPrescriptionBloc({
    required AppRouter appRouter,
    required AddPrescriptionUseCase addPrescriptionUseCase,
    required FindPatientsByNameUseCase findPatientsByNameUseCase,
  })  : _appRouter = appRouter,
        _addPrescriptionUseCase = addPrescriptionUseCase,
        _findPatientsByNameUseCase = findPatientsByNameUseCase,
        super(const AddPrescriptionState.initial()) {
    on<UpdatePatientName>(_onUpdatePatientName);
    on<SelectPatient>(_onSelectPatient);
    on<UpdateComment>(_onUpdateComment);
    on<AddPrescriptionEntry>(_onAddPrescriptionEntry);
    on<DeleteFixedPrescriptionEntry>(_onDeleteFixedPrescriptionEntry);
    on<SubmitPrescription>(_onSubmitPrescription);
  }

  void _onUpdateComment(
    UpdateComment event,
    Emitter<AddPrescriptionState> emit,
  ) {
    emit(state.copyWith(
      comment: event.comment,
    ));
  }

  Future<void> _onUpdatePatientName(
    UpdatePatientName event,
    Emitter<AddPrescriptionState> emit,
  ) async {
    final String name = event.name;

    emit(state.copyWith(
      isLoadingPatientSuggestions: true,
      patientName: name,
    ));

    final List<Patient> patients = await _findPatientsByNameUseCase.execute(
      FindPatientsByNamePayload(
        name: name,
        limit: AppConstants.SEARCH_BAR_LIMIT,
      ),
    );

    emit(state.copyWith(
      patientSuggestions: patients,
      isLoadingPatientSuggestions: false,
      patientError: '',
    ));
  }

  void _onSelectPatient(
    SelectPatient event,
    Emitter<AddPrescriptionState> emit,
  ) {
    emit(state.copyWith(
      patient: event.patient,
      patientError: '',
    ));
  }

  Future<void> _onAddPrescriptionEntry(
    AddPrescriptionEntry event,
    Emitter<AddPrescriptionState> emit,
  ) async {
    final PrescriptionEntryType? type = await _appRouter.push<PrescriptionEntryType>(
      const ChoosePrescriptionTypeRoute(),
    );

    switch (type) {
      case PrescriptionEntryType.fixed:
        {
          final FixedPrescriptionEntry? entry = await _appRouter.push(
            const AddFixedEntryRoute(),
          );

          if (entry != null) {
            final List<FixedPrescriptionEntry> fixedEntries = <FixedPrescriptionEntry>[
              ...state.fixedEntries,
              entry,
            ];

            emit(state.copyWith(
              fixedEntries: fixedEntries,
              fixedEntriesError: '',
            ));
          }
        }
      case PrescriptionEntryType.periodic:
        {
          await _appRouter.push(const AddPeriodicEntryRoute());
        }
      case null:
        return;
    }
  }

  void _onDeleteFixedPrescriptionEntry(
    DeleteFixedPrescriptionEntry event,
    Emitter<AddPrescriptionState> emit,
  ) {
    state.fixedEntries.removeAt(event.index);

    emit(state.copyWith(
      fixedEntries: List<FixedPrescriptionEntry>.from(
        state.fixedEntries,
        growable: true,
      ),
    ));
  }

  Future<void> _onSubmitPrescription(
    SubmitPrescription event,
    Emitter<AddPrescriptionState> emit,
  ) async {
    final String patientError = (state.patient.id != 0 || state.patientName.isNotEmpty)
        ? ''
        : LocaleKeys.addPrescription_main_selectPatient.translate();

    final String fixedEntriesError = state.fixedEntries.isNotEmpty
        ? ''
        : LocaleKeys.addPrescription_main_enterPrescriptionEntry.translate();

    emit(state.copyWith(
      patientError: patientError,
      fixedEntriesError: fixedEntriesError,
    ));

    final PrescriptionPlan plan = PrescriptionPlan(
      patientId: state.patient.id,
      comment: state.comment.nullIfEmpty(),
      fixedPlans: state.fixedEntries
          .map((FixedPrescriptionEntry entry) => FixedPrescriptionPlan(
                medicationId: entry.medication.id,
                dates: entry.dates,
                dose: entry.dose,
              ))
          .toList(),
    );

    try {
      final TestUseCase useCase = appDI.get<TestUseCase>();
      await useCase.execute(plan);

      // final Prescription prescription = await _addPrescriptionUseCase.execute(plan);
    } on ImpossiblePrescriptionException catch (_) {
      // TODO(SaxophOnyx): Show error toast
    } catch (_) {
      // TODO(SaxophOnyx): Show error toast
    }
  }
}
