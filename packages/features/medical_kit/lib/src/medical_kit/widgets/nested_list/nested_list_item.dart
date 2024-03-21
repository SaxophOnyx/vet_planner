import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'nested_list_item_sheet.dart';

class NestedListItem extends StatefulWidget {
  const NestedListItem({super.key});

  @override
  State<NestedListItem> createState() => _NestedListItemState();
}

class _NestedListItemState extends State<NestedListItem> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: AppDimens.DEFAULT_ANIMATION_DURATION,
    vsync: this,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: AppDimens.DEFAULT_ANIMATION_CURVE,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        GestureDetector(
          onTap: () => _controller.isCompleted ? _controller.reverse() : _controller.forward(),
          child: Container(
            decoration: BoxDecoration(
              color: colors.container,
              borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
            ),
            padding: const EdgeInsets.all(AppDimens.DEFAULT_CONTAINER_PADDING),
            child: const SizedBox(height: 80),
          ),
        ),
        SizeTransition(
          sizeFactor: _animation,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.DEFAULT_BORDER_RADIUS),
            child: NestedListItemSheet(),
          ),
        ),
      ],
    );
  }
}
