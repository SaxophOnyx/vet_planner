import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/prescription_details_bloc.dart';

class PrescriptionDetailsContent extends StatefulWidget {
  const PrescriptionDetailsContent({super.key});

  @override
  State<PrescriptionDetailsContent> createState() => _PrescriptionDetailsContentState();
}

class _PrescriptionDetailsContentState extends State<PrescriptionDetailsContent> {
  final TextEditingController _patientNameController = TextEditingController();
  final TextEditingController _medicationNameController = TextEditingController();
  final TextEditingController _doseController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _patientNameController.dispose();
    _medicationNameController.dispose();
    _doseController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      title: LocaleKeys.prescriptionDetails_title.observeTranslation(context),
      child: BlocConsumer<PrescriptionDetailsBloc, PrescriptionDetailsState>(
        listener: (BuildContext context, PrescriptionDetailsState state) {
          _patientNameController.text = state.patient.name;
          _medicationNameController.text = state.medication.name;
          _doseController.text = state.entry.dosage.toString();
          _commentController.text = state.prescription.comment ?? '';
        },
        builder: (BuildContext context, PrescriptionDetailsState state) {
          if (state.isLoading) {
            return const SizedBox(
              height: AppDimens.BOTTOM_SHEET_LOADING_CONTENT_HEIGHT,
              child: Center(
                child: AppLoadingIndicator(),
              ),
            );
          }

          return Column(
            children: <Widget>[
              AppTextField(
                label: LocaleKeys.addPrescription_main_patient.observeTranslation(context),
                textEditingController: _patientNameController,
                isReadOnly: true,
              ),
              const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
              AppTextField(
                label: LocaleKeys.addPrescription_addFixed_medication.observeTranslation(context),
                textEditingController: _medicationNameController,
                isReadOnly: true,
              ),
              const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
              AppTextField(
                label: LocaleKeys.addPrescription_addFixed_dose.observeTranslation(context),
                textEditingController: _doseController,
                isReadOnly: true,
              ),
              if (_commentController.text.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: AppDimens.DEFAULT_PAGE_PADDING),
                  child: AppTextField(
                    label:
                        LocaleKeys.addPrescription_main_commentOptional.observeTranslation(context),
                    textEditingController: _commentController,
                    isReadOnly: true,
                    isMultiline: true,
                  ),
                ),
              const SizedBox(height: AppDimens.MIN_BUTTON_AREA_SPACER_HEIGHT),
              AppButton(
                text: LocaleKeys.prescriptionDetails_close.observeTranslation(context),
                onPressed: () {
                  final PrescriptionDetailsBloc bloc = context.read<PrescriptionDetailsBloc>();
                  bloc.add(const Close());
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
