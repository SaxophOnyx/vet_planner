import 'package:domain/domain.dart';

import '../localization/localization.dart';

class MeasurementLocaleMapper {
  static String getLocale(MeasurementUnit unit) {
    switch (unit) {
      case MeasurementUnit.piece:
        return LocaleKeys.common_measurementUnit_piece.translate();
      case MeasurementUnit.milliliter:
        return LocaleKeys.common_measurementUnit_ml.translate();
    }
  }
}
