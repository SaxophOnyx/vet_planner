import 'package:flutter/material.dart';

abstract class AppDateUtils {
  static const String _separator = '/';

  static String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}$_separator${date.month.toString().padLeft(2, '0')}$_separator${date.year}';
  }

  static DateTime? tryParseDate(String date) {
    final List<String> parts = date.split(_separator);

    if (parts.length != 3) {
      return null;
    }

    final int? year = int.tryParse(parts[2]);
    if (year == null) {
      return null;
    }

    final int? month = int.tryParse(parts[1]);
    if (month == null || month > DateTime.monthsPerYear) {
      return null;
    }

    final int? day = int.tryParse(parts[0]);
    if (day == null || day > DateUtils.getDaysInMonth(year, month)) {
      return null;
    }

    return DateTime(year, month, day);
  }

  static DateTime mergeTime({
    required DateTime date,
    required DateTime time,
  }) {
    return DateTime.utc(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
      time.second,
      time.millisecond,
      time.microsecond,
    );
  }
}
