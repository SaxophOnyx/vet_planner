part of 'settings_bloc.dart';

abstract class SettingsEvent {
  const SettingsEvent();
}

class Initialize extends SettingsEvent {
  const Initialize();
}

class UpdateNotificationSettings extends SettingsEvent {
  final bool? receivePrescriptions;
  final bool? receiveMedications;

  const UpdateNotificationSettings({
    this.receivePrescriptions,
    this.receiveMedications,
  });
}
