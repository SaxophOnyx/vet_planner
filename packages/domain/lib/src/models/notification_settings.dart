class NotificationSettings {
  final bool receivePrescriptions;
  final bool receiveMedications;

  const NotificationSettings({
    required this.receivePrescriptions,
    required this.receiveMedications,
  });

  const NotificationSettings.initial()
      : receivePrescriptions = false,
        receiveMedications = false;
}
