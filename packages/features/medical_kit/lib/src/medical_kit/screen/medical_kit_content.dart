// ignore_for_file: prefer_const_constructors

import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../widgets/list_type_switch.dart';

class MedicalKitContent extends StatelessWidget {
  const MedicalKitContent({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: colors.background,
      body: Center(
        child: ListTypeSwitch(),
      ),
    );
  }
}
