import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../../shared/models/prescription_entry_type.dart';
import '../../shared/prescription_entry_type_mapper.dart';

@RoutePage<PrescriptionEntryType>()
class ChoosePrescriptionTypeScreen extends StatelessWidget {
  const ChoosePrescriptionTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = appDI.get<AppRouter>();

    return AppBottomSheet(
      title: LocaleKeys.addPrescription_chooseType_title.observeTranslation(context),
      child: Column(
        children: <Widget>[
          AppButton(
            text: PrescriptionEntryTypeMapper.getLocaleKey(PrescriptionEntryType.fixed).observeTranslation(context),
            onPressed: () => appRouter.maybePop<PrescriptionEntryType>(PrescriptionEntryType.fixed),
          ),
          const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
          AppButton(
            text: PrescriptionEntryTypeMapper.getLocaleKey(PrescriptionEntryType.periodic).observeTranslation(context),
            onPressed: () => appRouter.maybePop<PrescriptionEntryType>(PrescriptionEntryType.periodic),
          ),
        ],
      ),
    );
  }
}
