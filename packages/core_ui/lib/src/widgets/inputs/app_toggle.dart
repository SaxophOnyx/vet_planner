import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class AppToggle extends StatelessWidget {
  final String label;
  final bool value;
  final void Function(bool value) onChanged;

  const AppToggle({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Container(
      height: AppDimens.DEFAULT_INPUT_HEIGHT,
      padding: const EdgeInsets.symmetric(
        vertical: AppDimens.DEFAULT_LABEL_GAP * 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Text(
              label,
              style: AppFonts.inter16Regular.copyWith(
                color: colors.text,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: AppDimens.DEFAULT_PAGE_PADDING),
            child: AnimatedToggleSwitch<bool>.sizeByHeight(
              current: value,
              values: const <bool>[false, true],
              onChanged: onChanged,
              animationDuration: AppDimens.DEFAULT_ANIMATION_DURATION,
              animationCurve: AppDimens.DEFAULT_ANIMATION_CURVE,
              borderWidth: AppDimens.DEFAULT_BORDER_THICKNESS,
              indicatorSize: const Size.square(0.75),
              styleBuilder: (bool currValue) {
                if (currValue) {
                  return ToggleStyle(
                    backgroundColor: colors.container,
                    indicatorColor: colors.primary,
                    borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
                    borderColor: colors.textSecondary,
                    indicatorBorderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
                  );
                }

                return ToggleStyle(
                  backgroundColor: colors.container,
                  indicatorColor: colors.textSecondary,
                  borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
                  borderColor: colors.textSecondary,
                  indicatorBorderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
