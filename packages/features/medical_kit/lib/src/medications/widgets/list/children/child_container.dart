import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ChildContainer extends StatelessWidget {
  final Widget child;

  const ChildContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Container(
      padding: const EdgeInsets.all(AppDimens.DEFAULT_CONTAINER_PADDING),
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
        ),
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
