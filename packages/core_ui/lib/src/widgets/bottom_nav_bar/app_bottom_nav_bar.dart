import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Container(
      height: AppDimens.APP_BOTTOM_NAV_BAR_HEIGHT,
      decoration: BoxDecoration(
        color: colors.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
          topRight: Radius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
        ),
      ),
    );
  }
}
