import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../../shared/mappers/expiration_date_mapper.dart';

class ExpirationDateText extends StatelessWidget {
  final DateTime expiresAt;
  final DateTime? now;

  const ExpirationDateText({
    super.key,
    required this.expiresAt,
    this.now,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    final DateTime actualNow = now ?? DateTime.now();
    final Duration remaining = expiresAt.difference(actualNow);

    return Text(
      ExpirationDateMapper.getText(
        remaining: remaining,
        context: context,
      ),
      style: AppFonts.inter14Regular.copyWith(
        color: ExpirationDateMapper.getTextColor(
          remaining: remaining,
          colors: colors,
        ),
      ),
    );
  }
}
