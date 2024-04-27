extension MapIndexedExtension<T> on List<T> {
  List<E> mapIndexed<E>(E Function(T item, int index) transform) {
    final List<E> result = <E>[];

    for (int i = 0; i < length; ++i) {
      final T item = this[i];
      final E transformed = transform(item, i);
      result.add(transformed);
    }

    return result;
  }
}

extension DateTimeExtension on DateTime {
  bool get isWeekend => weekday == DateTime.saturday || weekday == DateTime.sunday;

  bool inRange(DateTime a, DateTime b) {
    return isAfter(a) && isBefore(b);
  }
}
