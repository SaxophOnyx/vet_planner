import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return GestureDetector(
      onTap: onPressed,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: AppDimens.DEFAULT_CONTROL_MIN_WIDTH,
          minHeight: AppDimens.DEFAULT_CONTROL_HEIGHT,
          maxHeight: AppDimens.DEFAULT_CONTROL_HEIGHT,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
          ),
          child: Padding(
            padding: const EdgeInsets.all(
              AppDimens.DEFAULT_CONTAINER_PADDING,
            ),
            child: Center(
              child: Text(
                text,
                style: AppFonts.inter16Regular.copyWith(
                  color: colors.onPrimary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
