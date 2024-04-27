import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'child_container.dart';

class NoStoredMedicationsChild extends StatelessWidget {
  final void Function() onAddStoredPressed;

  const NoStoredMedicationsChild({
    super.key,
    required this.onAddStoredPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ChildContainer(
      child: AppButton(
        text: 'Add stored medication',
        onPressed: onAddStoredPressed,
        style: AppButtonStyle.secondary,
      ),
    );
  }
}
