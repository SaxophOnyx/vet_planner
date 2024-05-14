part of 'add_prescription_bloc.dart';

abstract class AddPrescriptionEvent {
  const AddPrescriptionEvent();
}

class UpdateComment extends AddPrescriptionEvent {
  final String comment;

  const UpdateComment(this.comment);
}

class AddPrescriptionEntry extends AddPrescriptionEvent {
  const AddPrescriptionEntry();
}

class SubmitPrescription extends AddPrescriptionEvent {
  const SubmitPrescription();
}
