import 'package:flutter/material.dart';

import '../../../../core_ui.dart';

class AppSearchTextField extends StatelessWidget {
  final String label;
  final TextEditingController textEditingController;
  final String? error;

  const AppSearchTextField({
    super.key,
    required this.label,
    required this.textEditingController,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      label: label,
      textEditingController: textEditingController,
      suffixIcon: const Icon(Icons.search),
      error: error,
    );
  }
}
