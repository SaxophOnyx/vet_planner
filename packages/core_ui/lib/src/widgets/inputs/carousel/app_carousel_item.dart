import 'package:flutter/material.dart';

import '../../../../core_ui.dart';
import 'app_carousel_style_mapper.dart';

class AppCarouselItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final AppCarouselStyle style;

  const AppCarouselItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return AnimatedContainer(
      duration: AppDimens.DEFAULT_ANIMATION_DURATION,
      margin: const EdgeInsets.symmetric(horizontal: AppDimens.DEFAULT_LABEL_GAP),
      decoration: BoxDecoration(
        color: AppCarouselStyleMapper.getBackgroundColor(
          colors: colors,
          style: style,
          isSelected: isSelected,
        ),
        borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
        border: Border.all(
          color: colors.primary,
          width: AppDimens.DEFAULT_BORDER_THICKNESS_LARGE,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: AppFonts.inter16Regular.copyWith(
          color: AppCarouselStyleMapper.getTextColor(
            colors: colors,
            style: style,
            isSelected: isSelected,
          ),
        ),
      ),
    );
  }
}
