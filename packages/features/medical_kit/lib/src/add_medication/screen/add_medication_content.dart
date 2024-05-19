import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../bloc/add_medication_bloc.dart';

class AddMedicationContent extends StatefulWidget {
  const AddMedicationContent({super.key});

  @override
  State<AddMedicationContent> createState() => _AddMedicationContentState();
}

class _AddMedicationContentState extends State<AddMedicationContent> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _concentrationController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final AddMedicationBloc bloc = context.read<AddMedicationBloc>();

    _nameController.addListener(
      () => bloc.add(UpdateMedicationName(_nameController.text)),
    );

    _concentrationController.addListener(
      () => bloc.add(UpdateMedicationConcentration(int.tryParse(_concentrationController.text))),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _concentrationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;
    final AddMedicationBloc bloc = context.read<AddMedicationBloc>();

    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.medKit_addMedication_title.observeTranslation(context),
      ),
      backgroundColor: colors.background,
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.DEFAULT_PAGE_PADDING),
        child: BlocBuilder<AddMedicationBloc, AddMedicationState>(
          builder: (BuildContext context, AddMedicationState state) {
            return Column(
              children: <Widget>[
                AppTextField(
                  label: LocaleKeys.medKit_addMedication_name.observeTranslation(context),
                  textEditingController: _nameController,
                  error: state.nameError?.translate(),
                ),
                const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
                AppCarousel<MedicationType>(
                  label: LocaleKeys.medKit_addMedication_type.observeTranslation(context),
                  value: MedicationType.ampoule,
                  values: MedicationType.values,
                  onValueChanged: (MedicationType value) => bloc.add(
                    UpdateMedicationType(value),
                  ),
                  stringifier: (MedicationType type) =>
                      MedicationTypeLocaleMapper.getLocaleKey(type).observeTranslation(context),
                ),
                const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
                AppTextField(
                  label: LocaleKeys.medKit_addMedication_concentration.observeTranslation(context),
                  textEditingController: _concentrationController,
                  formatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  inputType: TextInputType.number,
                  error: state.concentrationError,
                ),
                const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
                const Spacer(),
                AppButton(
                  text: LocaleKeys.medKit_addMedication_add.observeTranslation(context),
                  onPressed: () => bloc.add(const SubmitInput()),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
