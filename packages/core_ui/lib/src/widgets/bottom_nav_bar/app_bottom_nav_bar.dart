import 'package:flutter/material.dart';

import '../../../core_ui.dart';
import 'app_bottom_nav_bar_item_widget.dart';

class AppBottomNavBar extends StatelessWidget {
  final List<AppBottomNavBarItem> items;
  final int index;
  final void Function(int index) onItemChanged;

  const AppBottomNavBar({
    super.key,
    required this.items,
    required this.index,
    required this.onItemChanged,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Container(
      height: AppDimens.APP_BOTTOM_NAV_BAR_HEIGHT,
      decoration: BoxDecoration(
        color: colors.container,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
          topRight: Radius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
        ),
        border: Border(
          top: BorderSide(
            color: colors.textSecondary,
            width: AppDimens.DEFAULT_BORDER_THICKNESS,
          ),
        ),
      ),
      padding: const EdgeInsets.only(top: AppDimens.DEFAULT_LABEL_GAP),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          for (int i = 0; i < items.length; ++i)
            Expanded(
              child: AppBottomNavBarItemWidget(
                data: items[i],
                isSelected: i == index,
                onTap: () {
                  if (i != index) {
                    onItemChanged(i);
                  }
                },
              ),
            ),
        ],
      ),
    );
  }
}
