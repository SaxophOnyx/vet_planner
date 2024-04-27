import 'package:flutter/material.dart';

import '../../../../core_ui.dart';

class AppCarouselItem extends StatelessWidget {
  final String title;

  const AppCarouselItem({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppDimens.DEFAULT_LABEL_GAP),
      decoration: BoxDecoration(
        color: colors.primary,
        borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: AppFonts.inter16Regular.copyWith(
          color: colors.onPrimary,
        ),
      ),
    );
  }
}
