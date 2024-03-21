import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'nested_list_item.dart';

class NestedList extends StatelessWidget {
  const NestedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const NoGlowScrollBehavior(),
      child: ListView.separated(
        itemCount: 10,
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(AppDimens.DEFAULT_LIST_ITEM_GAP),
        itemBuilder: (BuildContext context, int index) {
          return NestedListItem();
        },
        separatorBuilder: (_, __) => const SizedBox(height: AppDimens.DEFAULT_LIST_ITEM_GAP),
      ),
    );
  }
}
