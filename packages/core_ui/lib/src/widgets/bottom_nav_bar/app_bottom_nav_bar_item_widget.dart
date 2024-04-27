import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class AppBottomNavBarItemWidget extends StatelessWidget {
  final AppBottomNavBarItem data;
  final bool isSelected;
  final void Function() onTap;

  const AppBottomNavBarItemWidget({
    super.key,
    required this.data,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;
    final Color foreground = isSelected ? colors.primary : colors.textSecondary;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            data.icon,
            size: AppDimens.APP_BOTTOM_NAV_ICON_SIZE,
            color: foreground,
          ),
          Text(
            data.text,
            style: AppFonts.inter16Regular.copyWith(
              color: foreground,
            ),
          ),
        ],
      ),
    );
  }
}
