import '../../core.dart';

abstract class MedicationNameValidator {
  static String? validateName(String name) {
    if (name.isEmpty) {
      return LocaleKeys.common_validation_notEmpty.translate();
    }

    if (name.length > AppConstants.MAX_MEDICATION_NAME_LENGTH) {
      return LocaleKeys.common_validation_notExceed.translate(
        namedArgs: <String, String>{
          'max': '${AppConstants.MAX_MEDICATION_NAME_LENGTH}',
        },
      );
    }

    return null;
  }
}
