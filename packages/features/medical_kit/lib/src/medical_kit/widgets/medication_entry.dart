import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'medication_entry_child.dart';

class MedicationEntry extends StatelessWidget {
  final MedicationType medicationType;
  final void Function() onViewStoredMedicationsPressed;

  const MedicationEntry({
    super.key,
    required this.medicationType,
    required this.onViewStoredMedicationsPressed,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
        ),
        controlAffinity: ListTileControlAffinity.trailing,
        // TODO(SaxophOnyx): Think about expanded color and border radius
        backgroundColor: colors.success,
        collapsedBackgroundColor: colors.background,
        tilePadding: const EdgeInsets.all(AppDimens.DEFAULT_CONTAINER_PADDING),
        iconColor: colors.text,
        collapsedIconColor: colors.text,
        expansionAnimationStyle: AnimationStyle(
          curve: AppDimens.DEFAULT_ANIMATION_CURVE,
          duration: AppDimens.DEFAULT_ANIMATION_DURATION,
        ),
        children: <Widget>[
          MedicationEntryChild(
            onViewStoredMedicationsPressed: onViewStoredMedicationsPressed,
          ),
          const SizedBox(height: AppDimens.DEFAULT_CONTAINER_PADDING),
        ],
        title: Text(
          medicationType.name,
          style: AppFonts.inter16SemiBold.copyWith(
            color: colors.text,
          ),
        ),
        subtitle: Text(
          'Placeholder',
          style: AppFonts.inter16Regular.copyWith(
            color: colors.text,
          ),
        ),
        leading: Icon(
          Icons.local_hospital,
          color: colors.text,
          size: AppDimens.DEFAULT_LARGE_ICON_SIZE,
        ),
      ),
    );
  }
}
