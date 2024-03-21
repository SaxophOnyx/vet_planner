import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'medical_kit_app_bar_clipper.dart';

class MedicalKitAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(AppDimens.APP_BAR_HEIGHT);

  const MedicalKitAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: const MedicalKitAppBarClipper(),
          child: AppBar(
            backgroundColor: colors.primary,
            foregroundColor: colors.onPrimary,
            toolbarHeight: AppDimens.APP_BAR_HEIGHT,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
                bottomRight: Radius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
              ),
            ),
          ),
        ),
        Positioned.fill(
          bottom: -20,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 40,
              height: 40,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
