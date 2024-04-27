import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

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
      () => bloc.add(UpdateMedicationConcentration(_concentrationController.text)),
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
      appBar: const CustomAppBar(
        title: 'Placeholder',
      ),
      backgroundColor: colors.background,
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.DEFAULT_PAGE_PADDING),
        child: BlocBuilder<AddMedicationBloc, AddMedicationState>(
          builder: (BuildContext context, AddMedicationState state) {
            return Column(
              children: <Widget>[
                AppTextField(
                  label: 'Medication name',
                  textEditingController: _nameController,
                  error: state.nameError?.translate(),
                ),
                const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
                AppCarousel<MedicationType>(
                  label: 'Medication type',
                  value: MedicationType.ampoule,
                  values: MedicationType.values,
                  onValueChanged: (MedicationType value) => bloc.add(
                    UpdateMedicationType(value),
                  ),
                  stringifier: MedicationTypeLocaleMapper.getLocale,
                ),
                const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
                AppTextField(
                  label: 'Medication concentration',
                  textEditingController: _concentrationController,
                  error: state.concentrationError?.translate(),
                ),
                const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
                const Spacer(),
                AppButton(
                  text: 'Title',
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
