import 'package:flutter/material.dart';

import '../../../../core_ui.dart';
import 'app_bottom_sheet_handle_bar.dart';

class AppBottomSheet extends StatelessWidget {
  final String title;
  final Widget child;

  const AppBottomSheet({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Material(
      color: colors.background,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(AppDimens.BOTTOM_SHEET_BORDER_RADIUS),
        topRight: Radius.circular(AppDimens.BOTTOM_SHEET_BORDER_RADIUS),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.DEFAULT_PAGE_PADDING,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING / 2),
            const Align(
              child: AppBottomSheetHandleBar(),
            ),
            const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
            ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: AppDimens.BOTTOM_SHEET_MIN_HEIGHT,
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppFonts.inter20SemiBold.copyWith(
                  color: colors.text,
                ),
              ),
            ),
            child,
            const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
          ],
        ),
      ),
    );
  }
}
