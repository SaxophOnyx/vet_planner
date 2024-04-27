abstract class AppDateUtils {
  static const String _separator = '.';

  static String formatDate(DateTime date) {
    return '${date.day}$_separator${date.month}$_separator${date.year}';
  }

  // TODO(SaxophOnyx): Implement
  static DateTime? tryParseDate(String date) {
    throw UnimplementedError();
  }
}
