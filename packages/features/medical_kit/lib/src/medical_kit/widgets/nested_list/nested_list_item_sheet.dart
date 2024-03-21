import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class NestedListItemSheet extends StatelessWidget {
  const NestedListItemSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Container(
      decoration: BoxDecoration(
        color: colors.containerSecondary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
          bottomRight: Radius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
        ),
      ),
      height: 250,
    );
  }
}
