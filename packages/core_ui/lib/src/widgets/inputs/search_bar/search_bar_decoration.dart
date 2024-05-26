import 'package:flutter/material.dart';

import '../../../../core_ui.dart';

class SearchBarDecoration extends StatelessWidget {
  final bool isLoadingMore;
  final Widget child;

  const SearchBarDecoration({
    super.key,
    required this.isLoadingMore,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Container(
      decoration: BoxDecoration(
        color: colors.container,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: child,
          ),
          if (isLoadingMore)
            const Padding(
              padding: EdgeInsets.all(
                AppDimens.DEFAULT_LABEL_GAP,
              ),
              child: AppLoadingIndicator(),
            ),
        ],
      ),
    );
  }
}
