import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(AppDimens.APP_BAR_HEIGHT);

  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return AppBar(
      backgroundColor: colors.primary,
      foregroundColor: colors.onPrimary,
      toolbarHeight: AppDimens.APP_BAR_HEIGHT,
      titleTextStyle: AppFonts.inter16Regular.copyWith(
        color: colors.onPrimary,
      ),
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
          bottomRight: Radius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
        ),
      ),
    );
  }
}
