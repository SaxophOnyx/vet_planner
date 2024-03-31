import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    // TODO(SaxophOnyx): Implement properly styled navbar
    return const SizedBox();

    // return Container(
    //   margin: const EdgeInsets.all(AppDimens.DEFAULT_CONTAINER_PADDING),
    //   height: AppDimens.APP_BOTTOM_NAV_BAR_HEIGHT,
    //   decoration: BoxDecoration(
    //     color: colors.backgroundSecondary,
    //     borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
    //     border: Border.all(
    //       color: colors.textSecondary,
    //       width: AppDimens.DEFAULT_BORDER_THICKNESS,
    //     ),
    //   ),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //     children: <Widget>[
    //       AppBottomNavBarItem(
    //         icon: Icons.timeline,
    //         label: 'Administration',
    //         isSelected: false,
    //         onTap: () {},
    //       ),
    //       AppBottomNavBarItem(
    //         icon: Icons.medical_services,
    //         label: 'Medical kit',
    //         isSelected: true,
    //         onTap: () {},
    //       ),
    //     ],
    //   ),
    // );
  }
}
