import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class AppDropdownButton<T> extends StatelessWidget {
  final T value;
  final List<T> items;
  final void Function(T) onChanged;
  final String Function(T item) stringifier;
  final bool isExpanded;

  const AppDropdownButton({
    super.key,
    required this.value,
    required this.onChanged,
    required this.stringifier,
    required this.items,
    this.isExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return SizedBox(
      height: AppDimens.DEFAULT_INPUT_HEIGHT,
      child: DropdownButton2<T>(
        value: value,
        isExpanded: isExpanded,
        onChanged: (T? value) {
          if (value != null) {
            onChanged(value);
          }
        },
        underline: Container(
          height: AppDimens.DEFAULT_BORDER_THICKNESS,
          color: colors.textSecondary,
        ),
        iconStyleData: IconStyleData(
          iconSize: AppDimens.DEFAULT_SMALL_ICON_SIZE,
          iconEnabledColor: colors.textSecondary,
        ),
        items: items
            .map(
              (T item) => DropdownMenuItem<T>(
                value: item,
                child: Text(
                  stringifier(item),
                  style: AppFonts.inter16Regular.copyWith(
                    color: colors.text,
                  ),
                ),
              ),
            )
            .toList(),
        selectedItemBuilder: (BuildContext context) => items.map(
          (T item) {
            return Text(
              stringifier(item),
              style: AppFonts.inter16Regular.copyWith(
                color: colors.text,
              ),
            );
          },
        ).toList(),
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.all(AppDimens.DEFAULT_CONTAINER_PADDING),
          decoration: BoxDecoration(
            color: colors.backgroundSecondary,
            borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
            // boxShadow: <BoxShadow>[BoxShadows.getDefaultBoxShadow()],
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          padding: EdgeInsets.zero,
          elevation: 0,
          offset: const Offset(0, AppDimens.DEFAULT_BORDER_RADIUS),
          decoration: BoxDecoration(
            color: colors.backgroundSecondary,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
              bottomRight: Radius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
            ),
          ),
        ),
      ),
    );
  }
}
