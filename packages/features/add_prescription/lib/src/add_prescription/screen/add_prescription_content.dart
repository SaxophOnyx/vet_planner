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

  @override
  void initState() {
    super.initState();
    _commentController.addListener(() => _bloc.add(UpdateComment(_commentController.text)));
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.addPrescription_main_title.observeTranslation(context),
        style: CustomAppBarStyle.secondary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.DEFAULT_PAGE_PADDING,
        ),
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: AppDimens.DEFAULT_PAGE_PADDING),
                child: AppTextField(
                  label: LocaleKeys.addPrescription_main_commentOptional.observeTranslation(context),
                  textEditingController: _commentController,
                  isMultiline: true,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: AppDimens.DEFAULT_PAGE_PADDING,
                  bottom: AppDimens.DEFAULT_LABEL_GAP,
                ),
                child: Text(
                  LocaleKeys.addPrescription_main_prescriptionEntries.observeTranslation(context),
                  style: AppFonts.inter16Regular.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
              ),
            ),
            BlocBuilder<AddPrescriptionBloc, AddPrescriptionState>(
              builder: (BuildContext context, AddPrescriptionState state) {
                return PrescriptionEntryList(
                  fixedEntries: state.fixedEntries,
                );
              },
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: <Widget>[
                  const Spacer(),
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
        ),
      ),
    );
  }
}
