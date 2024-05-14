extension AppListExtension<T> on List<T> {
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

extension AppSetExtension<T> on Set<T> {
  Set<T> withRemovedOrAdded(T item) {
    if (contains(item)) {
      return Set<T>.from(this)..remove(item);
    } else {
      return Set<T>.from(this)..add(item);
    }
  }
}

extension AppDateTimeExtension on DateTime {
  bool get isWeekend => weekday == DateTime.saturday || weekday == DateTime.sunday;

  bool inRange(DateTime a, DateTime b) {
    return isAfter(a) && isBefore(b);
  }
}
