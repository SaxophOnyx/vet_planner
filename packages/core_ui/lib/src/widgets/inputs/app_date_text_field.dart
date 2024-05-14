import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';

import '../../../core_ui.dart';

class AppDateTextField extends StatefulWidget {
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
  State<AppDateTextField> createState() => _AppDateTextFieldState();
}

class _AppDateTextFieldState extends State<AppDateTextField> {
  final List<TextInputFormatter> formatters = <TextInputFormatter>[
    DateInputFormatter(),
  ];

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return AppTextField(
      label: widget.label,
      textEditingController: widget.textEditingController,
      error: widget.error,
      formatters: formatters,
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
