part of 'add_prescription_bloc.dart';

abstract class AddPrescriptionEvent {
  const AddPrescriptionEvent();
}

class UpdatePatientName extends AddPrescriptionEvent {
  final String name;

  const UpdatePatientName(this.name);
}

class UpdateComment extends AddPrescriptionEvent {
  final String comment;

  const UpdateComment(this.comment);
}

class AddPrescriptionEntry extends AddPrescriptionEvent {
  const AddPrescriptionEntry();
}

class DeleteFixedPrescriptionEntry extends AddPrescriptionEvent {
  final int index;

  const DeleteFixedPrescriptionEntry(this.index);
}

class SubmitPrescription extends AddPrescriptionEvent {
  const SubmitPrescription();
}
