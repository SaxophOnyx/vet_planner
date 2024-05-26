import 'package:flutter/material.dart';

import '../../../../core_ui.dart';

class SearchBarEmptyWidget extends StatelessWidget {
  final String nothingFoundLabel;
  final bool isSearchStringEmpty;

  const SearchBarEmptyWidget({
    super.key,
    required this.nothingFoundLabel,
    required this.isSearchStringEmpty,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    if (isSearchStringEmpty) {
      return const SizedBox();
    }

    return Container(
      height: AppDimens.DEFAULT_CONTROL_HEIGHT,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(AppDimens.DEFAULT_CONTAINER_PADDING),
      child: FittedBox(
        child: Text(
          nothingFoundLabel,
          style: AppFonts.inter16Regular.copyWith(
            color: colors.text,
          ),
        ),
      ),
    );
  }
}
