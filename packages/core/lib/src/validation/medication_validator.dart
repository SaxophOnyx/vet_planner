import '../../core.dart';

abstract class MedicationNameValidator {
  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return LocaleKeys.common_validation_notEmpty;
    }

    return null;
  }
}
