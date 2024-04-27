import 'package:domain/domain.dart';

import '../localization/localization.dart';

class MedicationTypeLocaleMapper {
  static String getLocale(MedicationType type) {
    switch (type) {
      case MedicationType.ampoule:
        return LocaleKeys.common_medicationType_ampoule.translate();
      case MedicationType.tablet:
        return LocaleKeys.common_medicationType_tablet.translate();
      case MedicationType.vial:
        return LocaleKeys.common_medicationType_vial.translate();
    }
  }
}
