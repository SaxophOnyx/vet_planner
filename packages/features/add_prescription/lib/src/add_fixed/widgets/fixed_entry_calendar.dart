import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class FixedEntryCalender extends StatefulWidget {
  final Set<DateTime> dates;
  final void Function(DateTime date) onDayPressed;

  const FixedEntryCalender({
    super.key,
    required this.dates,
    required this.onDayPressed,
  });

  @override
  State<FixedEntryCalender> createState() => _FixedEntryCalenderState();
}

class _FixedEntryCalenderState extends State<FixedEntryCalender> {
  late DateTime _focusedDay = widget.dates.firstOrNull ?? DateTime.now();

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    final TextStyle defaultTextStyle = AppFonts.inter16Regular.copyWith(
      color: colors.text,
    );

    final TextStyle weekdayTextStyle = AppFonts.inter16SemiBold.copyWith(
      color: colors.primary,
    );

    final BoxDecoration defaultDecoration = BoxDecoration(
      color: colors.container,
      borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
    );

    final BoxDecoration selectedDecoration = BoxDecoration(
      color: colors.primary,
      borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
    );

    return ColoredBox(
      color: colors.background,
      child: TableCalendar<int>(
        sixWeekMonthsEnforced: true,
        startingDayOfWeek: StartingDayOfWeek.monday,
        pageAnimationCurve: AppDimens.DEFAULT_ANIMATION_CURVE,
        pageAnimationDuration: AppDimens.DEFAULT_ANIMATION_DURATION,
        formatAnimationDuration: Duration.zero,
        daysOfWeekHeight: 32,
        calendarStyle: CalendarStyle(
          // TODO(SaxophOnyx): Enable outsideDaysVisible when fix jump issue
          outsideDaysVisible: false,
          isTodayHighlighted: false,
          defaultDecoration: defaultDecoration,
          markerDecoration: defaultDecoration,
          holidayDecoration: defaultDecoration,
          disabledDecoration: BoxDecoration(
            color: colors.background,
            borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
          ),
          selectedDecoration: selectedDecoration,
          weekendDecoration: defaultDecoration,
          outsideDecoration: defaultDecoration,
          defaultTextStyle: defaultTextStyle,
          holidayTextStyle: defaultTextStyle,
          weekendTextStyle: defaultTextStyle,
          outsideTextStyle: defaultTextStyle.copyWith(
            color: colors.textSecondary,
          ),
          selectedTextStyle: defaultTextStyle.copyWith(
            color: colors.onPrimary,
          ),
          disabledTextStyle: defaultTextStyle.copyWith(
            color: colors.transparent,
          ),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: weekdayTextStyle,
          weekendStyle: weekdayTextStyle,
        ),
        headerStyle: HeaderStyle(
          titleCentered: true,
          titleTextStyle: AppFonts.inter18SemiBold.copyWith(
            color: colors.primary,
          ),
          formatButtonVisible: false,
          leftChevronIcon: Icon(
            Icons.chevron_left,
            color: colors.primary,
          ),
          rightChevronIcon: Icon(
            Icons.chevron_right,
            color: colors.primary,
          ),
        ),
        selectedDayPredicate: (DateTime date) => widget.dates.contains(date),
        holidayPredicate: (_) => false,
        onDaySelected: (DateTime date, __) {
          _focusedDay = date;
          widget.onDayPressed(date);
        },
        focusedDay: _focusedDay,
        firstDay: DateTime.now().subtract(const Duration(days: 365)),
        lastDay: DateTime.now().add(const Duration(days: 365)),
      ),
    );
  }
}
