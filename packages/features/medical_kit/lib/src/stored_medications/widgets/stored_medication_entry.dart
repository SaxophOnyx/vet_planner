import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

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
      title: Text(
        'Placeholder',
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
        Icons.home,
        size: AppDimens.DEFAULT_LARGE_ICON_SIZE,
        color: colors.text,
      ),
    );
  }
}
