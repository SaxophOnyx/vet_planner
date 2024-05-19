import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: colors.primary,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(AppDimens.DEFAULT_CONTAINER_PADDING),
      alignment: Alignment.center,
      child: Icon(
        Icons.medical_services_outlined,
        color: colors.background,
        size: 150,
      ),
    );
  }
}
