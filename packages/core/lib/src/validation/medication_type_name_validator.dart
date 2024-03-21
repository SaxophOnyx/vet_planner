import '../../core.dart';

abstract class MedicationTypeNameValidator {
  static String? validate(String? name) {
    if (name == null || name.isEmpty) {
      return LocaleKeys.validation_common_notEmpty;
    }

    return null;
  }
}
