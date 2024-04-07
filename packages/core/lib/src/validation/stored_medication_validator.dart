import '../../core.dart';

abstract class StoredMedicationValidator {
  static String? validateExpirationDate(DateTime? date) {
    if (date == null) {
      return LocaleKeys.common_validation_notEmpty;
    }

    return null;
  }
}
