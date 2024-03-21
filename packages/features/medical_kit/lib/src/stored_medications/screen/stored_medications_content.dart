import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../widgets/stored_medication_list.dart';

class StoredMedicationsContent extends StatelessWidget {
  const StoredMedicationsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: colors.background,
      body: Column(
        children: <Widget>[
          Expanded(
            child: StoredMedicationList(),
          ),
          const SizedBox(height: AppDimens.DEFAULT_LIST_ITEM_GAP),
          AppButton(
            text: 'Add',
            onPressed: () {},
          ),
          const SizedBox(height: AppDimens.DEFAULT_LIST_ITEM_GAP),
        ],
      ),
    );
  }
}
