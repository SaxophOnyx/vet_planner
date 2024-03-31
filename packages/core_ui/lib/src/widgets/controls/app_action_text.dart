import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class AppActionText extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color? color;

  const AppActionText({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;
    final Color foreground = color ?? colors.primary;

    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        style: AppFonts.inter16SemiBold.copyWith(
          color: foreground,
          decoration: TextDecoration.underline,
          decorationColor: foreground,
        ),
      ),
    );
  }
}
