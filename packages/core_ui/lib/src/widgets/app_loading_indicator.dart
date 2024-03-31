import 'package:flutter/material.dart';

import '../../core_ui.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    // TODO(SaxophOnyx): Make rounded square
    return SizedBox(
      height: AppDimens.DEFAULT_CONTROL_HEIGHT,
      width: AppDimens.DEFAULT_CONTROL_HEIGHT,
      child: CircularProgressIndicator(
        color: colors.primary,
        strokeWidth: AppDimens.DEFAULT_LOADER_THICKNESS,
        strokeCap: StrokeCap.square,
      ),
    );
  }
}
