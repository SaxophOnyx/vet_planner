import 'package:flutter/material.dart';

import '../../../core_ui.dart';

// TODO(SaxophOnyx): Remove or refactor
class AppInputLabelWrapper extends StatelessWidget {
  final String text;
  final Widget child;

  const AppInputLabelWrapper({
    super.key,
    required this.text,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          text,
          style: AppFonts.inter16Regular.copyWith(
            color: colors.textSecondary,
          ),
        ),
        const SizedBox(height: AppDimens.DEFAULT_LABEL_GAP),
        child,
      ],
    );
  }
}
