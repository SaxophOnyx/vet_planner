import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'expiration_date_text.dart';

class StoredMedicationListItem extends StatelessWidget {
  final StoredMedication medication;

  const StoredMedicationListItem({
    super.key,
    required this.medication,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Container(
      decoration: BoxDecoration(
        color: colors.container,
        borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
      ),
      padding: const EdgeInsets.all(AppDimens.DEFAULT_CONTAINER_PADDING),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.warehouse,
            size: AppDimens.DEFAULT_LARGE_ICON_SIZE,
            color: colors.text,
          ),
          const SizedBox(width: AppDimens.DEFAULT_CONTAINER_PADDING),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                LocaleKeys.medKit_medications_storedWithId.observeTranslation(
                  context,
                  namedArgs: <String, String>{
                    'id': '${medication.manualTitle ?? medication.id.toString()}',
                  },
                ),
                style: AppFonts.inter16SemiBold.copyWith(
                  color: colors.text,
                ),
              ),
              const SizedBox(height: AppDimens.DEFAULT_LABEL_GAP),
              MarkupText(
                LocaleKeys.medKit_stored_quantityText.observeTranslation(
                  context,
                  namedArgs: <String, String>{
                    'free': '${medication.freeQuantity}',
                    'freeColor': colors.success.toHex(),
                    'reserved': '${medication.reservedQuantity}',
                    'reservedColor': colors.warning.toHex(),
                  },
                ),
                style: AppFonts.inter16SemiBold.copyWith(
                  color: colors.text,
                ),
              ),
              const SizedBox(height: AppDimens.DEFAULT_LABEL_GAP),
              ExpirationDateText(
                expiresAt: medication.expirationDate,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
