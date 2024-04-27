import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../widgets/prescription_calendar.dart';

class AddPrescriptionContent extends StatelessWidget {
  const AddPrescriptionContent({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateTime first = now.subtract(const Duration(days: 60));
    final DateTime last = now.add(const Duration(days: 60));

    final AppColors colors = context.appColors;

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Add prescription',
        style: CustomAppBarStyle.secondary,
      ),
      backgroundColor: colors.background,
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.DEFAULT_PAGE_PADDING),
        child: Column(
          children: <Widget>[
            PrescriptionCalendar(
              first: first,
              last: last,
              onDayPressed: (DateTime date) {
                debugPrint('onDaySelected');
              },
            ),
          ],
        ),
      ),
    );
  }
}
