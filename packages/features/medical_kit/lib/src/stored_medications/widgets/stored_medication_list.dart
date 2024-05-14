import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'stored_medication_list_item.dart';

class StoredMedicationList extends StatelessWidget {
  final List<StoredMedication> medications;

  const StoredMedicationList({
    super.key,
    required this.medications,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const NoGlowScrollBehavior(),
      child: ListView.separated(
        physics: const ClampingScrollPhysics(),
        itemCount: medications.length,
        itemBuilder: (BuildContext context, int index) {
          return StoredMedicationListItem(
            medication: medications[index],
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: AppDimens.DEFAULT_LIST_ITEM_GAP),
      ),
    );
  }
}
