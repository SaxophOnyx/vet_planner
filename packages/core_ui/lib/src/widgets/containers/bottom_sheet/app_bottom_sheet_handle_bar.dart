import 'package:flutter/material.dart';

import '../../../../core_ui.dart';

class AppBottomSheetHandleBar extends StatelessWidget {
  const AppBottomSheetHandleBar({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Container(
      width: 24,
      height: 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: colors.textSecondary,
      ),
    );
  }
}
