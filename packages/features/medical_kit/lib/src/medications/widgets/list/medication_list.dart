import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../../models/medication_entry.dart';
import 'medication_list_item.dart';

class MedicationList extends StatelessWidget {
  final List<MedicationEntry> medication;
  final void Function(int index) onManageStoredPressed;
  final void Function(int index) onAddStoredPressed;

  const MedicationList({
    super.key,
    required this.medication,
    required this.onManageStoredPressed,
    required this.onAddStoredPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const NoGlowScrollBehavior(),
      child: ListView.separated(
        physics: const ClampingScrollPhysics(),
        itemCount: medication.length,
        itemBuilder: (BuildContext context, int index) {
          return MedicationListItem(
            medication: medication[index],
            onManageStoredPressed: () => onManageStoredPressed(index),
            onAddStoredPressed: () => onAddStoredPressed(index),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: AppDimens.DEFAULT_LIST_ITEM_GAP),
      ),
    );
  }
}
