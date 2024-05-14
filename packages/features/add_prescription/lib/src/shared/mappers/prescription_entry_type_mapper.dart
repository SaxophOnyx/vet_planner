import 'package:core/core.dart';

import '../models/prescription_entry_type.dart';

abstract class PrescriptionEntryTypeMapper {
  static String getLocaleKey(PrescriptionEntryType entry) {
    switch (entry) {
      case PrescriptionEntryType.fixed:
        return LocaleKeys.addPrescription_entryTypes_fixed;
      case PrescriptionEntryType.periodic:
        return LocaleKeys.addPrescription_entryTypes_periodic;
    }
  }
}
