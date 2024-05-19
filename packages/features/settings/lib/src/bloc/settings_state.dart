part of 'settings_bloc.dart';

class SettingsState {
  final bool receivePrescriptions;
  final bool receiveMedications;
  final Loading loading;

  bool get isLoading => loading == Loading.inProgress;

  const SettingsState.initial()
      : loading = Loading.inProgress,
        receivePrescriptions = false,
        receiveMedications = false;

  const SettingsState({
    required this.loading,
    required this.receivePrescriptions,
    required this.receiveMedications,
  });

  SettingsState copyWith({
    Loading? loading,
    bool? receivePrescriptions,
    bool? receiveMedications,
  }) {
    return SettingsState(
      loading: loading ?? this.loading,
      receivePrescriptions: receivePrescriptions ?? this.receivePrescriptions,
      receiveMedications: receiveMedications ?? this.receiveMedications,
    );
  }
}
