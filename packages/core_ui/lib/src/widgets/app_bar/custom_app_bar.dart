import 'package:flutter/material.dart';

import '../../../core_ui.dart';
import 'custom_app_bar_style_mapper.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final CustomAppBarStyle style;

  @override
  Size get preferredSize => const Size.fromHeight(AppDimens.APP_BAR_HEIGHT);

  const CustomAppBar({
    super.key,
    required this.title,
    this.style = CustomAppBarStyle.primary,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    final Color background = CustomAppBarStyleMapper.getBackground(colors: colors, style: style);
    final Color foreground = CustomAppBarStyleMapper.getForeground(colors: colors, style: style);

    return AppBar(
      backgroundColor: background,
      foregroundColor: foreground,
      surfaceTintColor: colors.transparent,
      toolbarHeight: AppDimens.APP_BAR_HEIGHT,
      title: Text(
        title,
        style: AppFonts.inter24SemiBold.copyWith(
          color: foreground,
        ),
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
