import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class PrescriptionCalendar extends StatelessWidget {
  final DateTime first;
  final DateTime last;
  final void Function(DateTime date) onDayPressed;

  const PrescriptionCalendar({
    super.key,
    required this.first,
    required this.last,
    required this.onDayPressed,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    final TextStyle defaultTextStyle = AppFonts.inter18Regular.copyWith(
      color: colors.text,
    );

    final BoxDecoration defaultDecoration = BoxDecoration(
      color: Colors.indigo,
    );

    return TableCalendar<int>(
      startingDayOfWeek: StartingDayOfWeek.monday,
      pageAnimationCurve: AppDimens.DEFAULT_ANIMATION_CURVE,
      pageAnimationDuration: AppDimens.DEFAULT_ANIMATION_DURATION,
      holidayPredicate: (DateTime date) => date.isWeekend,
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        defaultDecoration: defaultDecoration,
        holidayDecoration: defaultDecoration,
        disabledDecoration: BoxDecoration(
          color: colors.textSecondary,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.red,
        ),
        defaultTextStyle: defaultTextStyle,
        holidayTextStyle: defaultTextStyle,
        disabledTextStyle: AppFonts.inter18Regular.copyWith(
          color: colors.transparent,
        ),
      ),
      headerStyle: HeaderStyle(
        titleCentered: true,
        titleTextStyle: AppFonts.inter18SemiBold.copyWith(
          color: colors.text,
        ),
        formatButtonVisible: false,
      ),
      onDaySelected: (DateTime date, __) => onDayPressed(date),
      focusedDay: first,
      firstDay: first,
      lastDay: last,
    );
  }
}
