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

  AddPrescriptionBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(const AddPrescriptionState.initial()) {
    on<UpdateComment>(_onUpdateComment);
    on<AddPrescriptionEntry>(_onAddPrescriptionEntry);
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

  Future<void> _onSubmitPrescription(
    SubmitPrescription event,
    Emitter<AddPrescriptionState> emit,
  ) async {}
}
