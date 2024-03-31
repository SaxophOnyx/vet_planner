import 'package:flutter/material.dart';

import '../../../../core_ui.dart';
import 'app_button_style_mapper.dart';

class AppButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final AppButtonStyle style;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.style = AppButtonStyle.primary,
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
            color: AppButtonStyleMapper.getBackground(colors: colors, style: style),
            borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
            border: Border.all(
              color: AppButtonStyleMapper.getBorder(colors: colors, style: style),
              width: AppDimens.DEFAULT_BORDER_THICKNESS,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.DEFAULT_CONTAINER_PADDING,
            ),
            child: Center(
              child: Text(
                text,
                style: AppFonts.inter16SemiBold.copyWith(
                  color: AppButtonStyleMapper.getText(colors: colors, style: style),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
