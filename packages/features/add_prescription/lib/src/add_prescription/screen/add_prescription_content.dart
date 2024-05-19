import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/add_prescription_bloc.dart';
import '../widgets/prescription_entry_list.dart';

class AddPrescriptionContent extends StatefulWidget {
  const AddPrescriptionContent({super.key});

  @override
  State<AddPrescriptionContent> createState() => _AddPrescriptionContentState();
}

class _AddPrescriptionContentState extends State<AddPrescriptionContent> {
  late final AddPrescriptionBloc _bloc = context.read<AddPrescriptionBloc>();
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _patientController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _commentController.addListener(() => _bloc.add(UpdateComment(_commentController.text)));
    _patientController.addListener(() => _bloc.add(UpdatePatientName(_patientController.text)));
  }

  @override
  void dispose() {
    _commentController.dispose();
    _patientController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.addPrescription_main_title.observeTranslation(context),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.DEFAULT_PAGE_PADDING,
        ),
        child: BlocBuilder<AddPrescriptionBloc, AddPrescriptionState>(
          builder: (BuildContext context, AddPrescriptionState state) {
            return CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
                      AppSearchTextField(
                        label: 'Patient',
                        textEditingController: _patientController,
                        error: state.patientError,
                      ),
                      const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
                      AppTextField(
                        label: LocaleKeys.addPrescription_main_commentOptional.observeTranslation(context),
                        textEditingController: _commentController,
                        isMultiline: true,
                      ),
                      const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
                      Text(
                        LocaleKeys.addPrescription_main_prescriptionEntries.observeTranslation(context),
                        style: AppFonts.inter16Regular.copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: AppDimens.DEFAULT_LABEL_GAP),
                    ],
                  ),
                ),
                PrescriptionEntryList(
                  fixedEntries: state.fixedEntries,
                  onDeletePressed: (int index) => _bloc.add(
                    DeleteFixedPrescriptionEntry(index),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: Text(
                            state.fixedEntriesError,
                            style: AppFonts.inter16Regular.copyWith(
                              color: colors.error,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppDimens.MIN_BUTTON_AREA_SPACER_HEIGHT),
                      AppButton(
                        text: LocaleKeys.addPrescription_main_addEntry.observeTranslation(context),
                        style: AppButtonStyle.secondary,
                        onPressed: () => _bloc.add(const AddPrescriptionEntry()),
                      ),
                      const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
                      AppButton(
                        text: LocaleKeys.addPrescription_main_submit.observeTranslation(context),
                        onPressed: () => _bloc.add(const SubmitPrescription()),
                      ),
                      const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
