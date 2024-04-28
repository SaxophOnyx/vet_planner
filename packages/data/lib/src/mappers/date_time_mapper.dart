abstract class DateTimeMapper {
  static DateTime fromEntity(int msSinceEpoch) {
    return DateTime.fromMillisecondsSinceEpoch(msSinceEpoch);
  }

  static int toEntity(DateTime dateTime) {
    return dateTime.millisecondsSinceEpoch;
  }
}
