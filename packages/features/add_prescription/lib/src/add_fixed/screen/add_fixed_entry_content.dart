import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/add_fixed_entry_bloc.dart';
import '../widgets/fixed_entry_calendar.dart';

class AddFixedEntryContent extends StatelessWidget {
  const AddFixedEntryContent({super.key});

  @override
  Widget build(BuildContext context) {
    final AddFixedEntryBloc bloc = context.read<AddFixedEntryBloc>();

    return AppBottomSheet(
      title: LocaleKeys.addPrescription_addFixed_title.observeTranslation(context),
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              BlocBuilder<AddFixedEntryBloc, AddFixedEntryState>(
                buildWhen: (AddFixedEntryState prev, AddFixedEntryState curr) {
                  return prev.dates.length != curr.dates.length;
                },
                builder: (BuildContext context, AddFixedEntryState state) {
                  return FixedEntryCalender(
                    dates: state.dates,
                    onDayPressed: (DateTime day) => bloc.add(DayPressed(day)),
                  );
                },
              ),
              const SizedBox(height: AppDimens.MIN_BUTTON_AREA_SPACER_HEIGHT),
              AppButton(
                text: 'Submit',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
