import 'package:add_prescription/add_prescription.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

import '../../../prescriptions.dart';

part 'prescriptions_event.dart';
part 'prescriptions_state.dart';

class PrescriptionsBloc extends Bloc<PrescriptionsEvent, PrescriptionsState> {
  final AppRouter _appRouter;
  final GetExpiringPrescriptionEntriesUseCase _getExpiringPrescriptionEntriesUseCase;
  final DeletePrescriptionEntriesByIdsUseCase _deletePrescriptionEntriesByIdsUseCase;

  PrescriptionsBloc({
    required AppRouter appRouter,
    required GetExpiringPrescriptionEntriesUseCase getExpiringPrescriptionEntriesUseCase,
    required DeletePrescriptionEntriesByIdsUseCase deletePrescriptionEntriesByIdsUseCase,
  })  : _appRouter = appRouter,
        _getExpiringPrescriptionEntriesUseCase = getExpiringPrescriptionEntriesUseCase,
        _deletePrescriptionEntriesByIdsUseCase = deletePrescriptionEntriesByIdsUseCase,
        super(const PrescriptionsState.initial()) {
    on<LoadData>(_onLoadData);
    on<AddPrescription>(_onAddPrescription);
    on<DeletePrescriptionEntry>(_onDeletePrescriptionEntry);
    on<ViewPrescriptionEntryDetails>(_onViewPrescriptionEntryDetails);
  }

  Future<void> _onLoadData(
    LoadData event,
    Emitter<PrescriptionsState> emit,
  ) async {
    emit(state.copyWith(
      loading: Loading.inProgress,
    ));

    final List<PrescriptionEntry> prescriptions =
        await _getExpiringPrescriptionEntriesUseCase.execute();

    emit(state.copyWith(
      loading: Loading.completed,
      prescriptions: prescriptions,
    ));
  }

  Future<void> _onAddPrescription(
    AddPrescription event,
    Emitter<PrescriptionsState> emit,
  ) async {
    final bool? didAddPrescription = await _appRouter.push(const AddPrescriptionRoute());

    if (didAddPrescription ?? false) {
      add(const LoadData());
    }
  }

  Future<void> _onDeletePrescriptionEntry(
    DeletePrescriptionEntry event,
    Emitter<PrescriptionsState> emit,
  ) async {
    final PrescriptionEntry entry = state.prescriptions[event.index];

    await _deletePrescriptionEntriesByIdsUseCase.execute(
      <int>[
        entry.id,
      ],
    );

    state.prescriptions.removeAt(event.index);

    emit(state.copyWith(
      prescriptions: state.prescriptions,
    ));

    // TODO(SaxophOnyx): Show success toast
  }

  Future<void> _onViewPrescriptionEntryDetails(
    ViewPrescriptionEntryDetails event,
    Emitter<PrescriptionsState> emit,
  ) async {
    final PrescriptionEntry entry = state.prescriptions[event.index];
    await _appRouter.push(
      PrescriptionDetailsRoute(entry: entry),
    );
  }
}
