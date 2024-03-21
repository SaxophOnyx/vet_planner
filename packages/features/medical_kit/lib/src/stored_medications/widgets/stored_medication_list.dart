import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'stored_medication_list_item.dart';

class StoredMedicationList extends StatelessWidget {
  const StoredMedicationList({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const NoGlowScrollBehavior(),
      child: ListView.separated(
        itemCount: 10,
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(AppDimens.DEFAULT_LIST_ITEM_GAP),
        itemBuilder: (BuildContext context, int index) {
          return const StoredMedicationListItem();
        },
        separatorBuilder: (_, __) => const SizedBox(height: AppDimens.DEFAULT_LIST_ITEM_GAP),
      ),
    );
  }
}
