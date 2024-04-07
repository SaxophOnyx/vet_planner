// ignore_for_file: prefer_const_constructors

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../prescriptions.dart';

enum TestEnum {
  a,
  b,
  c,
  d,
  e,
}

@RoutePage()
class PrescriptionsScreen extends StatelessWidget {
  const PrescriptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    final DateTime initialDate = DateTime.now();
    final DateTime firstDate = initialDate.subtract(const Duration(days: 30));
    final DateTime lastDate = initialDate.add(const Duration(days: 30));

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Prescriptions',
        style: CustomAppBarStyle.secondary,
      ),
      backgroundColor: colors.background,
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.DEFAULT_PAGE_PADDING),
        child: Column(
          children: <Widget>[
            TableCalendar(
              focusedDay: initialDate,
              firstDay: firstDate,
              lastDay: lastDate,
              calendarFormat: CalendarFormat.month,
              calendarStyle: CalendarStyle(),
              headerVisible: false,
              onDaySelected: (DateTime a, DateTime b) {
                debugPrint('onDaySelected: ${a.day}, ${b.day}');
              },
            ),
            const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
            AppDropdownButton<TestEnum>(
              value: TestEnum.a,
              onChanged: (TestEnum? value) {},
              stringifier: (TestEnum? value) => value?.name ?? '-',
              items: TestEnum.values,
            ),
            const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
            AppButton(
              text: 'Add entry',
              onPressed: () {
                final AppRouter appRouter = appDI.get<AppRouter>();
                appRouter.push(const AddPrescriptionEntryRoute());
              },
            ),
            // CalendarDatePicker2(
            //   config: CalendarDatePicker2Config(
            //     calendarType: CalendarDatePicker2Type.multi,
            //     disableModePicker: true,
            //     firstDate: firstDate,
            //     lastDate: lastDate,
            //   ),
            //   value: <DateTime?>[initialDate],
            //   onValueChanged: (_) {},
            // ),
          ],
        ),
      ),
    );
  }
}
