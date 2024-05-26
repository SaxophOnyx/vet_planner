part of 'prescriptions_bloc.dart';

class PrescriptionsState {
  final Loading loading;
  final List<PrescriptionEntry> prescriptions;

  bool get isLoading => loading == Loading.inProgress;

  const PrescriptionsState.initial()
      : loading = Loading.inProgress,
        prescriptions = const <PrescriptionEntry>[];

  const PrescriptionsState({
    required this.loading,
    required this.prescriptions,
  });

  PrescriptionsState copyWith({
    Loading? loading,
    List<PrescriptionEntry>? prescriptions,
  }) {
    return PrescriptionsState(
      loading: loading ?? this.loading,
      prescriptions: prescriptions ?? this.prescriptions,
    );
  }
}
