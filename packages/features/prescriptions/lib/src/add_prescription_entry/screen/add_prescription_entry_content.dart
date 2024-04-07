import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AddPrescriptionEntryContent extends StatelessWidget {
  const AddPrescriptionEntryContent({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      title: 'Test title',
      child: Column(
        children: <Widget>[
          AppButton(
            text: 'Add',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
