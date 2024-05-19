import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class StoredMedicationRecord extends StatelessWidget {
  final StoredMedication medication;

  const StoredMedicationRecord({
    super.key,
    required this.medication,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: colors.textSecondary,
            width: AppDimens.DEFAULT_BORDER_THICKNESS_LARGE,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: AppDimens.DEFAULT_CONTAINER_PADDING),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              medication.manualTitle ??
                  LocaleKeys.medKit_medications_storedWithId.observeTranslation(
                    context,
                    namedArgs: <String, String>{
                      'id': '${medication.id}',
                    },
                  ),
              style: AppFonts.inter16SemiBold.copyWith(
                color: colors.text,
              ),
            ),
            Text(
              LocaleKeys.medKit_medications_expiresAt.observeTranslation(
                context,
                namedArgs: <String, String>{
                  'date': '${AppDateUtils.formatDate(medication.expirationDate)}',
                },
              ),
              style: AppFonts.inter14Regular.copyWith(
                color: colors.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
