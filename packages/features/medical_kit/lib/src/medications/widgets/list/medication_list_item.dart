import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../../models/medication_entry.dart';
import 'children/no_stored_medication_child.dart';
import 'children/stored_medications_child.dart';

class MedicationListItem extends StatefulWidget {
  final MedicationEntry medication;
  final void Function() onManageStoredPressed;
  final void Function() onAddStoredPressed;

  const MedicationListItem({
    super.key,
    required this.medication,
    required this.onManageStoredPressed,
    required this.onAddStoredPressed,
  });

  @override
  State<MedicationListItem> createState() => _MedicationListItemState();
}

class _MedicationListItemState extends State<MedicationListItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;
    final Color textColor = _isExpanded ? colors.onPrimary : colors.text;

    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
      child: ExpansionTile(
        onExpansionChanged: (_) => setState(() => _isExpanded = !_isExpanded),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
        ),
        controlAffinity: ListTileControlAffinity.trailing,
        backgroundColor: colors.primary,
        collapsedBackgroundColor: colors.container,
        tilePadding: const EdgeInsets.symmetric(horizontal: AppDimens.DEFAULT_CONTAINER_PADDING),
        iconColor: colors.onPrimary,
        collapsedIconColor: colors.text,
        expansionAnimationStyle: AnimationStyle(
          curve: AppDimens.DEFAULT_ANIMATION_CURVE,
          duration: AppDimens.DEFAULT_ANIMATION_DURATION,
        ),
        title: Text(
          widget.medication.medication.name,
          style: AppFonts.inter16SemiBold.copyWith(
            color: textColor,
          ),
        ),
        subtitle: Text(
          'Placeholder',
          style: AppFonts.inter16Regular.copyWith(
            color: textColor,
          ),
        ),
        // TODO(SaxophOnyx): Choose icon based in the medication type
        leading: Icon(
          Icons.local_hospital,
          color: _isExpanded ? colors.onPrimary : colors.primary,
          size: AppDimens.DEFAULT_LARGE_ICON_SIZE,
        ),
        childrenPadding: const EdgeInsets.all(AppDimens.DEFAULT_CONTAINER_PADDING),
        children: <Widget>[
          if (widget.medication.stored.isEmpty)
            NoStoredMedicationsChild(
              onAddStoredPressed: widget.onAddStoredPressed,
            )
          else
            StoredMedicationsChild(
              storedMedications: widget.medication.stored,
              onManageStoredMedicationsPressed: widget.onManageStoredPressed,
            ),
        ],
      ),
    );
  }
}
