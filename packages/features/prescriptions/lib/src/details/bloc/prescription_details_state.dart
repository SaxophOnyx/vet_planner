part of 'prescription_details_bloc.dart';

class PrescriptionDetailsState {
  final Loading loading;

  bool get isLoading => loading == Loading.inProgress;

  const PrescriptionDetailsState() : loading = Loading.inProgress;
}
