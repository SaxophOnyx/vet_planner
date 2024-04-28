abstract class AppDateUtils {
  static const String _separator = '.';

  static String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}$_separator${date.month.toString().padLeft(2, '0')}$_separator${date.year}';
  }

  // TODO(SaxophOnyx): Implement
  static DateTime? tryParseDate(String date) {
    throw UnimplementedError();
  }
}
