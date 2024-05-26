part of 'prescriptions_bloc.dart';

abstract class PrescriptionsEvent {
  const PrescriptionsEvent();
}

class LoadData extends PrescriptionsEvent {
  const LoadData();
}

class AddPrescription extends PrescriptionsEvent {
  const AddPrescription();
}

class DeletePrescriptionEntry extends PrescriptionsEvent {
  final int index;

  const DeletePrescriptionEntry(this.index);
}

class ViewPrescriptionEntryDetails extends PrescriptionsEvent {
  final int index;

  const ViewPrescriptionEntryDetails(this.index);
}
