import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class AppDropdownButton<T> extends StatelessWidget {
  final String text;
  final T? value;
  final List<T> items;
  final void Function(T) onChanged;
  final String Function(T item) stringifier;

  const AppDropdownButton({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
    required this.stringifier,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          text,
          textAlign: TextAlign.left,
          style: AppFonts.inter16Regular.copyWith(
            color: colors.textSecondary,
          ),
        ),
        const SizedBox(width: AppDimens.DEFAULT_LABEL_GAP),
        Container(
          height: AppDimens.DEFAULT_INPUT_HEIGHT,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
            border: Border.all(
              color: colors.textSecondary,
              width: AppDimens.DEFAULT_BORDER_THICKNESS,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<T>(
              value: value,
              isExpanded: true,
              onChanged: (T? value) {
                if (value != null) {
                  onChanged(value);
                }
              },
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
                padding: const EdgeInsets.symmetric(
                  vertical: AppDimens.DEFAULT_CONTAINER_PADDING,
                ),
                decoration: BoxDecoration(
                  color: colors.container,
                  borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
                  // boxShadow: <BoxShadow>[BoxShadows.getDefaultBoxShadow()],
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                padding: EdgeInsets.zero,
                elevation: 0,
                offset: const Offset(0, -AppDimens.DEFAULT_BORDER_RADIUS),
                decoration: BoxDecoration(
                  color: colors.container,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
                    bottomRight: Radius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
