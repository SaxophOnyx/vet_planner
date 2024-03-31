import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class AppDateTextField extends StatelessWidget {
  final String label;
  final TextEditingController textEditingController;
  final String? error;

  const AppDateTextField({
    super.key,
    required this.label,
    required this.textEditingController,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return AppTextField(
      label: label,
      textEditingController: textEditingController,
      error: error,
      suffixIcon: GestureDetector(
        // TODO(SaxophOnyx): Show dialog or overlay, then set text to a controller
        onTap: () {},
        child: Icon(
          Icons.calendar_month,
          size: AppDimens.DEFAULT_SMALL_ICON_SIZE,
          color: colors.textSecondary,
        ),
      ),
    );
  }
}
