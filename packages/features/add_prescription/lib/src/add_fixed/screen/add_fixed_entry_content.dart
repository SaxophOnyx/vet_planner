import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../../shared/prescription_service.dart';
import '../bloc/add_fixed_entry_bloc.dart';
import '../widgets/fixed_entry_calendar.dart';

class AddFixedEntryContent extends StatefulWidget {
  const AddFixedEntryContent({super.key});

  @override
  State<AddFixedEntryContent> createState() => _AddFixedEntryContentState();
}

class _AddFixedEntryContentState extends State<AddFixedEntryContent> {
  final TextEditingController _medicationController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final AddFixedEntryBloc bloc = context.read<AddFixedEntryBloc>();
    _medicationController.addListener(
      () => bloc.add(
        UpdateMedicationName(_medicationController.text),
      ),
    );
  }

  @override
  void dispose() {
    _medicationController.dispose();
    super.dispose();
  }

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
                builder: (BuildContext context, AddFixedEntryState state) {
                  return AppSearchTextField(
                    label: 'Medication',
                    textEditingController: _medicationController,
                    error: state.medicationError,
                  );
                },
              ),
              const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
              BlocBuilder<AddFixedEntryBloc, AddFixedEntryState>(
                buildWhen: (AddFixedEntryState prev, AddFixedEntryState curr) {
                  return (prev.dates.length != curr.dates.length) || (prev.datesError != curr.datesError);
                },
                builder: (BuildContext context, AddFixedEntryState state) {
                  return FixedEntryCalender(
                    dates: state.dates,
                    onDayPressed: (DateTime day) => bloc.add(DayPressed(day)),
                    error: state.datesError,
                  );
                },
              ),
              const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
              BlocBuilder<AddFixedEntryBloc, AddFixedEntryState>(
                builder: (BuildContext context, AddFixedEntryState state) {
                  return Column(
                    children: <Widget>[
                      AppCarousel<int>(
                        label: 'Dose',
                        value: state.dose,
                        values: PrescriptionService.getAvailableDosages(state.medication.type.measurementUnit),
                        onValueChanged: (int value) => bloc.add(UpdateDose(value)),
                        stringifier: (int item) => item.toString(),
                        style: AppCarouselStyle.small,
                      ),
                      const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
                      AppCarousel<int>(
                        label: 'Hour',
                        value: state.hour,
                        values: PrescriptionService.getAvailableHours(),
                        onValueChanged: (int value) => bloc.add(UpdateTime(value)),
                        stringifier: (int item) => item.toString(),
                        style: AppCarouselStyle.small,
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: AppDimens.MIN_BUTTON_AREA_SPACER_HEIGHT),
              AppButton(
                text: 'Submit',
                onPressed: () => bloc.add(const SubmitEntry()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
