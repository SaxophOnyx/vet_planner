abstract class NotificationsRepository {
  Future<void> ensureInitialized();

  Future<void> showNotification({
    required String title,
  });
}
