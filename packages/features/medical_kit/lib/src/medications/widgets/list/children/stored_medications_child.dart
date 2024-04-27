import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'child_container.dart';
import 'stored_medication_record.dart';

class StoredMedicationsChild extends StatelessWidget {
  final List<StoredMedication> storedMedications;
  final void Function() onManageStoredMedicationsPressed;

  const StoredMedicationsChild({
    super.key,
    required this.storedMedications,
    required this.onManageStoredMedicationsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ChildContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: storedMedications.length,
            itemBuilder: (BuildContext context, int index) {
              return StoredMedicationRecord(
                medication: storedMedications[index],
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: AppDimens.DEFAULT_LIST_ITEM_GAP),
          ),
          const SizedBox(height: AppDimens.DEFAULT_CONTAINER_PADDING),
          AppButton(
            text: 'Manage stored',
            onPressed: onManageStoredMedicationsPressed,
            style: AppButtonStyle.secondary,
          ),
        ],
      ),
    );
  }
}
