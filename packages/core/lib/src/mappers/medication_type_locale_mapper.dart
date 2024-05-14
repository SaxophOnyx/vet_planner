import 'package:domain/domain.dart';

import '../localization/localization.dart';

class MedicationTypeLocaleMapper {
  static String getLocaleKey(MedicationType type) {
    switch (type) {
      case MedicationType.ampoule:
        return LocaleKeys.common_medicationType_ampoule;
      case MedicationType.tablet:
        return LocaleKeys.common_medicationType_tablet;
      case MedicationType.vial:
        return LocaleKeys.common_medicationType_vial;
    }
  }
}
