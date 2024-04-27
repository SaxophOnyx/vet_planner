part of 'add_prescription_bloc.dart';

abstract class AddPrescriptionEvent {
  const AddPrescriptionEvent();
}

class AddOneOffTake extends AddPrescriptionEvent {
  final DateTime date;

  const AddOneOffTake(this.date);
}

class AddPeriodicTake extends AddPrescriptionEvent {
  const AddPeriodicTake();
}

class SubmitPrescription extends AddPrescriptionEvent {
  const SubmitPrescription();
}
