part of 'prescription_details_bloc.dart';

abstract class PrescriptionDetailsEvent {
  const PrescriptionDetailsEvent();
}

class LoadData extends PrescriptionDetailsEvent {
  const LoadData();
}
