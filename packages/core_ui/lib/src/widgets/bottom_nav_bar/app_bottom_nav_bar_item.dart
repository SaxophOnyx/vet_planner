import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class AppBottomNavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final void Function() onTap;

  const AppBottomNavBarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          icon,
          size: AppDimens.APP_BOTTOM_NAV_ICON_SIZE,
          color: isSelected ? colors.onPrimary : colors.textSecondary,
        ),
        Text(
          label,
          style: AppFonts.inter16Regular.copyWith(
            color: colors.onPrimary,
          ),
        ),
      ],
    );
  }
}
