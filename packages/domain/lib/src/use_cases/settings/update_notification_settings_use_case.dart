import '../../../domain.dart';

class UpdateNotificationSettingsPayload {
  final bool receivePrescriptions;
  final bool receiveMedications;

  const UpdateNotificationSettingsPayload({
    required this.receivePrescriptions,
    required this.receiveMedications,
  });
}

class UpdateNotificationSettingsUseCase extends FutureUseCase<UpdateNotificationSettingsPayload, void> {
  final SettingsRepository _settingsRepository;

  const UpdateNotificationSettingsUseCase({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  @override
  Future<void> execute(UpdateNotificationSettingsPayload payload) async {
    await _settingsRepository.updateNotificationSettings(
      receivePrescriptions: payload.receivePrescriptions,
      receiveMedications: payload.receiveMedications,
    );
  }
}
