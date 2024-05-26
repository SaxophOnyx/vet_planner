import 'package:flutter/material.dart';

import '../../core_ui.dart';

class AppLoadingIndicator extends StatelessWidget {
  final double size;

  const AppLoadingIndicator({
    super.key,
    this.size = AppDimens.DEFAULT_CONTROL_HEIGHT,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    // TODO(SaxophOnyx): Make rounded square
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        color: colors.primary,
        strokeWidth: AppDimens.DEFAULT_LOADER_THICKNESS,
        strokeCap: StrokeCap.square,
      ),
    );
  }
}
