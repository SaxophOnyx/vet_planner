import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class MedicationEntryChild extends StatelessWidget {
  final void Function() onViewStoredMedicationsPressed;

  const MedicationEntryChild({
    super.key,
    required this.onViewStoredMedicationsPressed,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimens.DEFAULT_CONTAINER_PADDING,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.DEFAULT_CONTAINER_PADDING,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
          bottomRight: Radius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
        ),
      ),
      alignment: Alignment.bottomCenter,
      child: AppActionText(
        text: 'View all',
        onPressed: onViewStoredMedicationsPressed,
      ),
    );
  }
}
