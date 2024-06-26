import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../../shared/models/prescription_entry_type.dart';
import '../../shared/prescription_entry_type_mapper.dart';

class PrescriptionEntryListItem extends StatelessWidget {
  final String title;
  final PrescriptionEntryType entryType;
  final void Function() onDeletePressed;

  const PrescriptionEntryListItem({
    super.key,
    required this.title,
    required this.entryType,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
      ),
      dense: true,
      tileColor: colors.container,
      title: Text(
        title,
        style: AppFonts.inter18SemiBold.copyWith(
          color: colors.primary,
        ),
      ),
      subtitle: Text(
        PrescriptionEntryTypeMapper.getLocaleKey(entryType).observeTranslation(context),
        style: AppFonts.inter16Regular.copyWith(
          color: colors.textSecondary,
        ),
      ),
      leading: Icon(
        Icons.event_rounded,
        size: AppDimens.DEFAULT_SMALL_ICON_SIZE,
        color: colors.text,
      ),
      trailing: GestureDetector(
        onTap: onDeletePressed,
        child: Icon(
          Icons.delete,
          size: AppDimens.DEFAULT_SMALL_ICON_SIZE,
          color: colors.text,
        ),
      ),
    );
  }
}
