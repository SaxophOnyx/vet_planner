import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class AppContainer extends StatelessWidget {
  final Widget child;

  const AppContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Container(
      decoration: BoxDecoration(
        color: colors.container,
        borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
      ),
      padding: const EdgeInsets.all(AppDimens.DEFAULT_CONTAINER_PADDING),
      child: child,
    );
  }
}
