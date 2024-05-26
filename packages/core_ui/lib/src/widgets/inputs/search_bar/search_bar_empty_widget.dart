import 'package:flutter/material.dart';

import '../../../../core_ui.dart';

class SearchBarEmptyWidget extends StatelessWidget {
  final bool isSearchStringEmpty;

  const SearchBarEmptyWidget({
    super.key,
    required this.isSearchStringEmpty,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    if (isSearchStringEmpty) {
      return const SizedBox();
    }

    return ListTile(
      title: Text(
        'Nothing found',
        style: AppFonts.inter16Regular.copyWith(
          color: colors.text,
        ),
      ),
    );
  }
}
