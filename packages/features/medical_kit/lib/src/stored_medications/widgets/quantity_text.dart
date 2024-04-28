import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class QuantityText extends StatelessWidget {
  final int free;
  final int reserved;

  const QuantityText({
    super.key,
    required this.free,
    required this.reserved,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    // TODO(SaxophOnyx): Implement locale
    return RichText(
      text: TextSpan(
        text: '$free free',
        style: AppFonts.inter14Regular.copyWith(
          color: colors.success,
        ),
        children: <InlineSpan>[
          TextSpan(
            text: ', ',
            style: AppFonts.inter14Regular.copyWith(
              color: colors.text,
            ),
          ),
          TextSpan(
            text: '$reserved reserved',
            style: AppFonts.inter14Regular.copyWith(
              color: colors.warning,
            ),
          ),
        ],
      ),
    );
  }
}
