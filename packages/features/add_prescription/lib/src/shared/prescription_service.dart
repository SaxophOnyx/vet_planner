import 'package:domain/domain.dart';

abstract class PrescriptionService {
  static List<int> getAvailableDosages(MeasurementUnit unit) {
    switch (unit) {
      case MeasurementUnit.milliliter:
        return const <int>[0, 5, 10, 15, 20, 25, 50];
      case MeasurementUnit.piece:
        return const <int>[0, 1, 2, 3, 4];
    }
  }

  static List<int> getAvailableHours() {
    return List<int>.generate(24, (int i) => i);
  }
}
