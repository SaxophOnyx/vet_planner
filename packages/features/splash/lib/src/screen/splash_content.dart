import 'package:core_ui/core_ui.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/app_logo.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: colors.background,
      ),
      child: Scaffold(
        backgroundColor: colors.background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Center(
              child: AppLogo(),
            ),
            const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
            Text(
              LocaleKeys.splash_appName.observeTranslation(context),
              style: AppFonts.inter32SemiBold.copyWith(
                color: colors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
