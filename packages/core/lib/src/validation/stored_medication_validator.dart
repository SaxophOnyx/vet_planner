import '../../core.dart';

abstract class StoredMedicationValidator {
  static String? validateExpirationDate(DateTime? date) {
    if (date == null) {
      return LocaleKeys.validation_common_notEmpty;
    }

    return null;
  }
}
