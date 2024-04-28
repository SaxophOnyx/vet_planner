import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'expiration_date_text.dart';
import 'quantity_text.dart';

class StoredMedicationEntry extends StatelessWidget {
  final StoredMedication medication;

  const StoredMedicationEntry({
    super.key,
    required this.medication,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
      ),
      tileColor: colors.container,
      title: Text(
        'Placeholder',
        style: AppFonts.inter16SemiBold.copyWith(
          color: colors.text,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          QuantityText(
            free: medication.freeQuantity,
            reserved: medication.reservedQuantity,
          ),
          const SizedBox(height: AppDimens.DEFAULT_LABEL_GAP),
          Align(
            alignment: Alignment.centerRight,
            child: ExpirationDateText(
              expiresAt: medication.expirationDate,
            ),
          ),
        ],
      ),
      isThreeLine: true,
      leading: Icon(
        Icons.warehouse,
        size: AppDimens.DEFAULT_LARGE_ICON_SIZE,
        color: colors.text,
      ),
    );
  }
}
