import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class AppFloatingButton extends StatelessWidget {
  final void Function() onPressed;

  const AppFloatingButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return InkWell(
      onTap: onPressed,
      child: Container(
        width: AppDimens.DEFAULT_CONTROL_HEIGHT,
        height: AppDimens.DEFAULT_CONTROL_HEIGHT,
        decoration: BoxDecoration(
          color: colors.primary,
          borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
        ),
        child: Icon(
          Icons.add,
          color: colors.onPrimary,
        ),
      ),
    );
  }
}
