bool compareAllTo<T>(Iterable<T> values, T value) {
  for (final T v in values) {
    if (v != value) {
      return false;
    }
  }

  return true;
}
