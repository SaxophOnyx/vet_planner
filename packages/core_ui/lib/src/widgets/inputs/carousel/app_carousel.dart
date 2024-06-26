import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core_ui.dart';
import 'app_carousel_item.dart';
import 'app_carousel_style_mapper.dart';

class AppCarousel<T> extends StatelessWidget {
  final String label;
  final T value;
  final List<T> values;
  final void Function(T value) onValueChanged;
  final String Function(T item) stringifier;
  final AppCarouselStyle style;

  const AppCarousel({
    super.key,
    required this.label,
    required this.value,
    required this.values,
    required this.onValueChanged,
    required this.stringifier,
    this.style = AppCarouselStyle.large,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: AppFonts.inter16Regular.copyWith(
            color: colors.textSecondary,
          ),
        ),
        const SizedBox(height: AppDimens.DEFAULT_LABEL_GAP),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
              color: colors.container,
            ),
            child: CarouselSlider(
              items: values
                  .map((T item) => AppCarouselItem(
                        title: stringifier(item),
                        style: style,
                        isSelected: item == value,
                      ))
                  .toList(),
              options: CarouselOptions(
                height: AppDimens.DEFAULT_INPUT_HEIGHT,
                viewportFraction: AppCarouselStyleMapper.getViewportFraction(style),
                scrollPhysics: const ClampingScrollPhysics(),
                onPageChanged: (int index, CarouselPageChangedReason reason) {
                  if (reason == CarouselPageChangedReason.manual) {
                    final T value = values[index];
                    onValueChanged(value);
                  }
                },
                disableCenter: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
