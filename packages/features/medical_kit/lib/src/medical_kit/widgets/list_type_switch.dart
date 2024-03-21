import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ListTypeSwitch extends StatefulWidget {
  const ListTypeSwitch({super.key});

  @override
  State<ListTypeSwitch> createState() => _ListTypeSwitchState();
}

class _ListTypeSwitchState extends State<ListTypeSwitch> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return ToggleSwitch(
      activeBgColor: <Color>[
        colors.primary,
      ],
      inactiveBgColor: colors.container,
      activeFgColor: colors.onPrimary,
      inactiveFgColor: colors.text,
      cornerRadius: AppDimens.DEFAULT_BORDER_RADIUS,
      curve: AppDimens.DEFAULT_ANIMATION_CURVE,
      animationDuration: AppDimens.DEFAULT_ANIMATION_DURATION.inMilliseconds,
      animate: true,
      icons: const <IconData>[
        Icons.list_rounded,
        Icons.notes_rounded,
      ],
    );
  }
}
