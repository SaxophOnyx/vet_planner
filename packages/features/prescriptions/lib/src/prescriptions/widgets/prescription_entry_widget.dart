import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class PrescriptionEntryWidget extends StatelessWidget {
  final PrescriptionEntry entry;
  final void Function() onDeletePressed;
  final void Function() onViewDetailsPressed;

  const PrescriptionEntryWidget({
    super.key,
    required this.entry,
    required this.onViewDetailsPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
      ),
      tileColor: colors.container,
      title: GestureDetector(
        onTap: onViewDetailsPressed,
        child: Text(
          AppDateUtils.formatDate(entry.datetime),
          style: AppFonts.inter16SemiBold.copyWith(
            color: colors.text,
          ),
        ),
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
