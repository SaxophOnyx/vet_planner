import '../../../domain.dart';

class GetNotificationSettingsUseCase extends FutureUseCase<NoParams, NotificationSettings> {
  final SettingsRepository _settingsRepository;

  const GetNotificationSettingsUseCase({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  @override
  Future<NotificationSettings> execute([NoParams? payload]) async {
    return _settingsRepository.getNotificationSettings();
  }
}
