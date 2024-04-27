import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class QuantityText extends StatelessWidget {
  final int initial;
  final int remaining;
  final int reserved;

  const QuantityText({
    super.key,
    required this.initial,
    required this.remaining,
    required this.reserved,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;
    final int free = remaining - reserved;

    // TODO(SaxophOnyx): Implement locale
    return RichText(
      text: TextSpan(
        text: '$free',
        style: AppFonts.inter14Regular.copyWith(
          color: colors.success,
        ),
        children: <InlineSpan>[
          TextSpan(
            text: '/$initial ',
            style: AppFonts.inter14Regular.copyWith(
              color: colors.text,
            ),
          ),
          TextSpan(
            text: '($reserved reserved)',
            style: AppFonts.inter14Regular.copyWith(
              color: colors.warning,
            ),
          ),
        ],
      ),
    );
  }
}
