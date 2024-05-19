import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../../shared/models/fixed_prescription_entry.dart';
import '../../shared/models/prescription_entry_type.dart';
import 'prescription_entry_list_item.dart';

class PrescriptionEntryList extends StatelessWidget {
  final List<FixedPrescriptionEntry> fixedEntries;
  final void Function(int index) onDeletePressed;

  const PrescriptionEntryList({
    super.key,
    required this.fixedEntries,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: fixedEntries.length,
      itemBuilder: (BuildContext context, int index) {
        final FixedPrescriptionEntry entry = fixedEntries[index];

        return PrescriptionEntryListItem(
          title: entry.medication.name,
          entryType: PrescriptionEntryType.fixed,
          onDeletePressed: () => onDeletePressed(index),
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: AppDimens.DEFAULT_LIST_ITEM_GAP),
    );
  }
}
